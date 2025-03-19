<?php

namespace app\teach\controller;

use app\teach\BaseController;
use app\teach\validate\PublisherCheck;
use think\exception\ValidateException;
use think\facade\Db;
use think\facade\View;

class Publisher extends BaseController
{
    public function index()
    {
        if (request()->isAjax()) {
            $param = get_params();
            $where = [];
            if (!empty($param['keywords'])) {
                $where[] = ['name', 'like', '%' . $param['keywords'] . '%'];
            }

            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];

            $list = Db::name('book_publisher')
                ->where($where)
                ->order(['sort' => 'asc', 'name' => 'desc'])
                ->paginate($rows);
            return table_assign(0, '', $list);
        } else {
            return view();
        }
    }


    public function save()
    {
        $param = get_params();
        if ($param['id'] > 0) {
            try {
                validate(PublisherCheck::class)->scene('edit')->check($param);
            } catch (ValidateException $e) {
                // 验证失败 输出错误信息
                return to_assign(1, $e->getError());
            }
            Db::name('book_publisher')->strict(false)->field(true)->update($param);
        } else {
            try {
                validate(PublisherCheck::class)->scene('add')->check($param);
            } catch (ValidateException $e) {
                // 验证失败 输出错误信息
                return to_assign(1, $e->getError());
            }
            Db::name('book_publisher')->strict(false)->field(true)->insertGetId($param);
        }
        return to_assign();

    }

    //禁用/启用
    public function disable()
    {
        $param = get_params();
        $res = Db::name('book_publisher')->update($param);
        if ($res !== false) {
            return to_assign();
        } else {
            return to_assign(1, '操作失败');
        }
    }
}