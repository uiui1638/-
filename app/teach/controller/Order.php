<?php

namespace app\teach\controller;

use app\teach\BaseController;
use think\facade\Db;

class Order extends BaseController
{
    public function seller()
    {
        if (request()->isAjax()) {
            $where = [];
            $where[] = ['seller_id', '=', get_login_admin('id')];
            $where[] = ['c.order_no', '<>', 'null'];
            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];
            $data = Db::name('book_cart')->alias('c')
                ->field('c.*,b.book_name,o.address,o.name,o.phone')
                ->join('book b', 'c.book_id=b.id','left')
                ->join('book_order o', 'c.order_no=o.order_no','left')
                ->where($where)
                ->order('c.cart_id desc')
                ->paginate($rows);
            return table_assign(0, '', $data);
        } else {
            return view();
        }
    }

    public function buyer()
    {
        if (request()->isAjax()) {
            $where = [];
            $where[] = ['c.user_id', '=', get_login_admin('id')];
            $where[] = ['c.order_no', '<>', 'null'];
            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];
            $data = Db::name('book_cart')->alias('c')
                ->field('c.*,b.book_name,o.address,a.nickname as seller_name,o.name,o.phone')
                ->join('book b', 'c.book_id=b.id','left')
                ->join('admin a', 'c.seller_id=a.id','left')
                ->join('book_order o', 'c.order_no=o.order_no','left')
                ->where($where)
                ->order('c.cart_id desc')
                ->paginate($rows);
            return table_assign(0, '', $data);
        } else {
            return view();
        }
    }

}