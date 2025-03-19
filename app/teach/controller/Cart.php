<?php

namespace app\teach\controller;

use app\teach\BaseController;
use think\Exception;
use think\exception\ValidateException;
use think\facade\Db;
use think\facade\View;

class Cart extends BaseController
{
    public function index()
    {
        if (request()->isAjax()) {
            $param = get_params();
            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];
            $where = [];
            $where[] = ['a.user_id', '=', get_login_admin('id')];
            $where[] = ['a.order_no', '=', NULL];
            $content = Db::name('book_cart')->alias('a')
                ->field('a.*,b.*,c.nickname as seller_name')
                ->where($where)
                ->join('book b', 'a.book_id = b.id', 'left')
                ->join('admin c', 'c.id = b.user_id', 'left')
                ->order('a.seller_id asc')
                ->paginate($rows);
            return table_assign(0, '', $content);
        } else {
            $list = Db::name('book_address')->where('user_id', get_login_admin('id'))->select();
            View::assign('list', $list);
            return view();
        }
    }

    public function del()
    {
        $cart_id = get_params('cart_id');
        Db::name('book_cart')->delete($cart_id);
        return to_assign();
    }

    public function edit()
    {
        $param = get_params();
        $status=get_params('status');
        if ($status == 2) {  //买家收货
            //金额处理
        }
        Db::name('book_cart')->where('cart_id', $param['cart_id'])->strict(false)->update($param);
        return to_assign(0, "操作成功！");
    }

    public function buy()
    {
        $book_id = get_params('book_id');  //获得所购商品的id(购物车表的),格式为[1,3,6]
        $money = 0;
        $order_no = get_no();  //生成订单号，在common.php文件中

        Db::startTrans();
        try {
            foreach ($book_id as $id) {
                $where = [];
                $where[] = ['book_id', '=', $id];
                $where[] = ['order_no', '=', null];
                $book = Db::name('book_cart')->where($where)->find();

                $old=Db::name('book')->where('id', '=', $id)->find();

                if ($book['num'] > $old['number']) {
                    throw new Exception('库存不足！');
                }
                $old['number']=$old['number']-$book['num'];
                $old['sales']=$old['sales']+$book['num'];
                Db::name('book')->update($old); //更新库存和销售

                $money += $book['num'] * $book['money'];
                $book['order_no'] = $order_no;
                Db::name('book_cart')->update($book);
            }

            //获得下单的地址id
            $address_id = get_params('address_id');
            $address = Db::name('book_address')->where('id', $address_id)->find();

            $data = [];
            $data['order_no'] = $order_no;
            $data['money'] = $money;
            $data['user_id'] = get_login_admin('id');  //买家id
            $data['order_date'] = time();
            if ($address != null) {
                $data['address'] = $address['address'];
                $data['phone'] = $address['phone'];
                $data['name'] = $address['name'];
            }

            Db::name('book_order')->insert($data);
            Db::commit();
        }
        catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            //return to_assign(1, '提交失败:' . $e->getMessage());
            return to_assign(1, '提交失败:库存不足！');
        }
    }

}