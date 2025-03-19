<?php

namespace app\teach\controller;

use app\teach\BaseController;
use app\teach\validate\UserCheck;
use PhpOffice\PhpSpreadsheet\IOFactory;
use think\exception\ValidateException;
use think\facade\Db;
use think\facade\View;

class User extends BaseController
{
    public function index()
    {
        if (request()->isAjax()) {
            $param = get_params();
            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];
            $where = [];
            if (!empty($param['keywords'])) {
                $where[] = ['username|nickname|mobile', 'like', '%' . $param['keywords'] . '%'];
            }
            $where[] = ['id', '>', 1];  //不显示超级管理员
            $data = Db::name('admin')
                ->where($where)
                ->order('create_time asc')
                ->paginate($rows);
            foreach ($data as $k => $v) {
                $item = $v;
                $groupId = Db::name('AdminGroupAccess')->where(['uid' => $item['id']])->column('group_id');
                $groupName = Db::name('AdminGroup')->where('id', 'in', $groupId)->column('title');
                $item['groupName'] = implode(',', $groupName);
                $item['last_login_time'] = empty($item['last_login_time']) ? '-' : date('Y-m-d H:i', $item['last_login_time']);
                $data->offsetSet($k, $item);
            }
            return table_assign(0, '', $data);
        } else {
            return view();
        }

    }

    public function add()
    {
        return view();
    }

    public function edit()
    {
        $id = get_params("id");

        $data = Db::name('Admin')->where(['id' => $id])->find();
        $data['group_id'] = Db::name('AdminGroupAccess')->where(['uid' => $id])->column('group_id');

        View::assign('data', $data);
        return view();
    }

    public function save()
    {
        $param = get_params();
        if (!empty($param['id']) && $param['id'] > 0) { //修改
            try {
                validate(UserCheck::class)->scene('edit')->check($param);
            } catch (ValidateException $e) {
                // 验证失败 输出错误信息
                return to_assign(1, $e->getError());
            }
            if (!empty($param['edit_pwd'])) {
                //重置密码
                if (empty($param['edit_pwd_confirm']) or $param['edit_pwd_confirm'] !== $param['edit_pwd']) {
                    return to_assign(1, '两次密码不一致');
                }
                $param['salt'] = set_salt(20);
                $param['pwd'] = set_password($param['edit_pwd'], $param['salt']);
            }

            // 启动事务
            Db::startTrans();
            try {
                Db::name('Admin')->where(['id' => $param['id']])->strict(false)->field(true)->update($param);
                Db::name('AdminGroupAccess')->where(['uid' => $param['id']])->delete();
                foreach ($param['group_id'] as $k => $v) {
                    //为了系统安全，只有系统所有者才可创建id为1的管理员分组
                    if ($v == 1 and get_login_admin('id') !== 1) {
                        throw new ValidateException("你没有权限创建系统所有者", 1);
                    }
                    $data[$k] = [
                        'uid' => $param['id'],
                        'group_id' => $v,
                    ];
                }
                Db::name('AdminGroupAccess')->strict(false)->field(true)->insertAll($data);
                if (!isset($param['thumb']) || $param['thumb'] == '') {
                    $char = mb_substr($param['nickname'], 0, 1, 'utf-8');
                    Db::name('Admin')->where('id', $param['id'])->update(['thumb' => $this->to_avatars($char)]);
                }
                add_log('edit', $param['id'], $param);
                //清除菜单\权限缓存
                clear_cache('adminMenu');
                clear_cache('adminRules');
                // 提交事务
                Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return to_assign(1, '提交失败:' . $e->getMessage());
            }
        } else {   //新增
            try {
                validate(UserCheck::class)->scene('add')->check($param);
            } catch (ValidateException $e) {
                // 验证失败 输出错误信息
                return to_assign(1, $e->getError());
            }
            $param['salt'] = set_salt(20);
            $param['pwd'] = set_password($param['pwd'], $param['salt']);
            // 启动事务
            Db::startTrans();
            try {
                $uid = Db::name('Admin')->strict(false)->field(true)->insertGetId($param);
                foreach ($param['group_id'] as $k => $v) {
                    //为了系统安全，只有系统所有者才可创建id为1的管理员分组
                    if ($v == 1 and get_login_admin('id') !== 1) {
                        throw new ValidateException("你没有权限创建系统所有者", 1);
                    }
                    $data[$k] = [
                        'uid' => $uid,
                        'group_id' => $v,
                    ];
                }
                Db::name('AdminGroupAccess')->strict(false)->field(true)->insertAll($data);
                // 提交事务
                Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return to_assign(1, '提交失败:' . $e->getMessage());
            }
        }
        return to_assign();
    }



    public function delete()
    {
        $id = get_params("id");
        if ($id == 1) {
            return to_assign(0, "超级管理员，不能删除");
        }
        Db::name('AdminGroupAccess')->where('uid', $id)->delete();
        if (Db::name('Admin')->delete($id) !== false) {
            return to_assign(0, "删除成功");
        } else {
            return to_assign(1, "删除失败");
        }
    }

    //导入用户
    public function import_user()
    {
        $file = request()->file('file');
        if (!$file) {
            print_r('请选择需要导入的文件');
            die;
        }
        $spreadsheet = IOFactory::load($file->getRealPath());
        $sheet = $spreadsheet->getActiveSheet();
        $row = $sheet->getHighestRow();  //得到总行数
        $success = 0;
        for ($i = 2; $i <= $row; $i++) {
            $data = [];
            $data['username'] = $sheet->getCell('A' . $i)->getValue();
            $data['nickname'] = $sheet->getCell('B' . $i)->getValue();
            $result = Db::name('admin')->insert($data);
            if ($result > 0) $success++;
        }
        return to_assign(0, "成功导入" . $success . "条数据！");
    }

}