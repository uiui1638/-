<?php
/**
 * 
 * @license https://opensource.org/licenses/Apache-2.0
 * 
 */

declare (strict_types = 1);

namespace app\admin\controller;

use app\admin\BaseController;
use app\admin\model\User as UserList;
use dateset\Dateset;
use think\facade\Db;
use think\facade\View;

class User extends BaseController
{
    public function index()
    {
        if (request()->isAjax()) {
            $param = get_params();
            $where = array();
            if (!empty($param['keywords'])) {
                $where[] = ['nickname|username|name|mobile|province|city', 'like', '%' . $param['keywords'] . '%'];
            }

            //按时间检索
            $start_time = isset($param['start_time']) ? strtotime(urldecode($param['start_time'])) : 0;
            $end_time = isset($param['end_time']) ? strtotime(urldecode($param['end_time'])) : 0;

            if ($start_time > 0 && $end_time > 0) {
                if ($start_time === $end_time) {
                    $where[] = ['register_time', '=', $start_time];
                } else {
                    $where[] = ['register_time', '>=', $start_time];
                    $where[] = ['register_time', '<=', $end_time];
                }
            } elseif ($start_time > 0 && $end_time == 0) {
                $where[] = ['register_time', '>=', $start_time];
            } elseif ($start_time == 0 && $end_time > 0) {
                $where[] = ['register_time', '<=', $end_time];
            }

            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];
            $content = UserList::where($where)
                ->order('id desc')
                ->paginate($rows, false, ['query' => $param])
                ->each(function ($item, $key) {
                    $item->register_time = empty($item->register_time) ? '-' : date('Y-m-d H:i', $item->register_time);
                    $item->level_name = Db::name('UserLevel')->where(['id' => $item->level])->value('title');
                });
            return table_assign(0, '', $content);
        } else {
            return view();
        }
    }

    //编辑
    public function edit()
    {
        $param = get_params();
        if (request()->isAjax()) {
            if (!empty($param['id']) && $param['id'] > 0) {
                $param['update_time'] = time();
                $res = Db::name('User')->where(['id' => $param['id']])->strict(false)->field(true)->update($param);
                if ($res !== false) {
                    add_log('edit', $param['id'], $param);
                    return to_assign();
                } else {
                    return to_assign(1, '提交失败');
                }
            }
        } else {
            $id = isset($param['id']) ? $param['id'] : 0;
            $user = Db::name('User')->where(['id' => $id])->find();
            $levels = Db::name('UserLevel')->where(['status' => 1])->select()->toArray();
            View::assign('user', $user);
            View::assign('levels', $levels);
            return view();
        }
    }

    //查看
    public function view()
    {
        $id = empty(get_params('id')) ? 0 : get_params('id');
        $user = Db::name('User')->where(['id' => $id])->find();
        $user['level_name'] = Db::name('UserLevel')->where(['id' => $user['level']])->value('title');
        add_log('view', get_params('id'));
        View::assign('user', $user);
        return view();
    }
    //禁用/启用
    public function disable()
    {
        $id = get_params("id");
        $data['status'] = get_params("status");
        $data['update_time'] = time();
        $data['id'] = $id;
        if (Db::name('User')->update($data) !== false) {
            if ($data['status'] == 0) {
                add_log('disable', $id, $data);
            } else if ($data['status'] == 1) {
                add_log('recovery', $id, $data);
            }
            return to_assign();
        } else {
            return to_assign(1, "操作失败");
        }
    }

    //日志
    public function log()
    {
        if (request()->isAjax()) {
            $param = get_params();
            $where = array();
            if (!empty($param['keywords'])) {
                $where[] = ['nickname|content|param_id', 'like', '%' . $param['keywords'] . '%'];
            }
            if (!empty($param['action'])) {
                $where[] = ['title', '=', $param['action']];
            }
            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];
            $content = DB::name('UserLog')
                ->field("id,uid,nickname,title,content,ip,param_id,param,FROM_UNIXTIME(create_time,'%Y-%m-%d %H:%i:%s') create_time")
                ->order('create_time desc')
                ->where($where)
                ->paginate($rows, false, ['query' => $param]);

            $content->toArray();
            foreach ($content as $k => $v) {
                $data = $v;
                $param_array = json_decode($v['param'], true);
                $param_value = '';
                foreach ($param_array as $key => $value) {
                    if (is_array($value)) {
                        $value = array_to_string($value);
                    }
                    $param_value .= $key . ':' . $value . '&nbsp;&nbsp;|&nbsp;&nbsp;';
                }
                $data['param'] = $param_value;
                $content->offsetSet($k, $data);
            }
            return table_assign(0, '', $content);
        } else {
            $type_action = get_config('log.user_action');
            View::assign('type_action', $type_action);
            return view();
        }
    }

    //记录
    public function record()
    {
        if (request()->isAjax()) {
            $param = get_params();
            $where = array();
            if (!empty($param['keywords'])) {
                $where[] = ['nickname|title', 'like', '%' . $param['keywords'] . '%'];
            }
            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];
            $content = Db::name('UserLog')
                ->field("id,uid,nickname,title,content,ip,param,create_time")
                ->order('create_time desc')
                ->where($where)
                ->paginate($rows, false, ['query' => $param]);

            $content->toArray();
			$date_set = new Dateset();
            foreach ($content as $k => $v) {
                $data = $v;
                $param_array = json_decode($v['param'], true);
                $name = '';
                if (!empty($param_array['name'])) {
                    $name = '：' . $param_array['name'];
                }
                if (!empty($param_array['title'])) {
                    $name = '：' . $param_array['title'];
                }
                $data['content'] = $v['content'] . $name;
				$data['times'] = $date_set->time_trans($v['create_time']);
                $content->offsetSet($k, $data);
            }
            return table_assign(0, '', $content);
        } else {
            return view();
        }
    }

}
