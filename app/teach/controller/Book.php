<?php

namespace app\teach\controller;


use app\teach\BaseController;
use think\facade\Db;
use think\facade\View;

class Book extends BaseController
{
    public function index()
    {
        if (request()->isAjax()) {
            $param = get_params();
            $where = array();
            if (!empty($param['keywords'])) {
                $where[] = ['b.book_name', 'like', '%' . $param['keywords'] . '%'];
            }
            if (!empty($param['type_id'])) {
                $where[] = ['b.type_id', '=', $param['type_id']];
            }
            if (is_seller()) { //如果是卖家
                $where[] = ['b.user_id', '=', get_login_admin('id')];
            }
            if (is_buyer()) { //如果是买家
                $where[] = ['b.result', '=', 1];
            }
            $rows = empty($param['limit']) ? get_config('app.page_size') : $param['limit'];

            $data = Db::name('book')->alias('b')
                ->where($where)
                ->field('b.*,c.type_name,a.nickname as seller_name')
                ->join('book_type c', 'b.type_id = c.id', 'left')
                ->join('admin a', 'a.id = b.user_id', 'left')
                ->order('update_time,id desc')
                ->paginate($rows);
            return table_assign(0, '', $data);
        } else {

            //下面两行代码只对管理员有次，获得管理员从图书类别页面中点击类别名称传过来的type_id
            $type_id=get_params('type_id');
            View::assign('type_id', $type_id);

            $book_type = Db::name('book_type')->select();
            View::assign('book_type', $book_type); //要加上 use think\facade\View;拷贝时会有提示
            if (is_buyer()) return view('index_buyer');
            if (is_manager()) return view('index_manager');
            if (is_seller()) return view('index_seller');
        }

    }

    public function edit()
    {
        $param = get_params();
        if (request()->isAjax()) {
            Db::name('book')->where('id', $param['id'])->strict(false)->update($param);  //strict此处可以不加，详见https://doc.thinkphp.cn/v8_0/strict.html
            return to_assign();
        } else {

            $id = isset($param['id']) ? $param['id'] : 0;

            $data = Db::name('book')->where(['id' => $id])->find();
            View::assign('data', $data);

            $book_type = Db::name('book_type')->select();
            View::assign('book_type', $book_type);

            $book_publisher = Db::name('book_publisher')->select();
            View::assign('book_publisher', $book_publisher);

            return view();
        }
    }

    public function add()
    {
        if (request()->isAjax()) {
            $param['user_id'] = get_login_admin('id');
            Db::name('book')->strict(false)->insert($param);
            return to_assign(0, "操作成功！");
        } else {
            $book_type = Db::name('book_type')->select();
            View::assign('book_type', $book_type);

            $book_publisher = Db::name('book_publisher')->order('sort asc')->select();
            View::assign('book_publisher', $book_publisher);

            return view();
        }
    }

    public function up_down()  //图书上下架
    {
        $param = get_params();
        if ($param['status'] == '1') $param['status'] = '0';
        else $param['status'] = '1';
        Db::name('book')->update($param);
        return to_assign(0, '操作成功！');
    }


    public function delete()
    {
        $book_id = get_params('id');  //获得前台传来的数据，内容为[1,3,7]
        Db::name('book')->delete($book_id);
        return to_assign();
    }

    //管理员审核图书
    public function audit()
    {
        $book_id = get_params('id');  //获得前台传来的数据，内容为[1,3,7]
        $result = get_params('result');
        Db::name('book')->where('id', 'in', $book_id)->update(['result' => $result]);
        return to_assign();
    }

    public function search()
    {
        $type = get_params('book_type');
        $data = Db::name('book')->where('type_id', $type)->select();
        return $data;
    }


    public function add_cart()  //加入购物车
    {
        $book_id = get_params('id');

        $data = [];
        $data['book_id'] = $book_id;

        $where = [];
        $where[] = ['user_id', '=', get_login_admin('id')];
        $where[] = ['book_id', '=', $book_id];
        $where[] = ['order_no', '=', null];
        $cart = Db::name('book_cart')->where($where)->find();  //查看购物车中是否有加入的图书数据

        if ($cart == null) {
            $book = Db::name('book')->where('id', $book_id)->find();
            $data['seller_id'] = $book['user_id'];
            $data['user_id'] = get_login_admin('id');
            $data['num'] = 1;
            $data['money'] = $book['price'];
            Db::name('book_cart')->insert($data);
        } else {
            $data['num'] = $cart['num'] + 1;
            $data['cart_id'] = $cart['cart_id'];
            Db::name('book_cart')->update($data);
        }
        return to_assign(0, "加入购物车成功！");
    }

    public function read()
    {
        $param = get_params();
        $id = isset($param['id']) ? $param['id'] : 0;
        $detail = Db::name('book')->where(['id' => $id])->find($id);
        if (!empty($detail)) {
            View::assign('detail', $detail);
            return view();
        } else {
            throw new \think\exception\HttpException(404, '找不到页面');
        }
    }

    //获取销售列表，首页用
    public function get_sale_list()
    {
        $where = [];
        $where[] = ['result', '=', '1'];
        $data = Db::name('book')->alias('b')
            ->field('b.*,c.type_name,a.nickname as seller_name')
            ->join('book_type c', 'b.type_id = c.id', 'left')
            ->join('admin a', 'a.id = b.user_id', 'left')
            ->where($where)
            ->order('sales desc')
            ->limit(3)
            ->select();
        return to_assign(0, '', $data);
    }

    public function get_new_list()
    {
        $where = [];
        $where[] = ['result', '=', '1'];
        $data = Db::name('book')->alias('b')
            ->field('b.*,c.type_name,a.nickname as seller_name')
            ->join('book_type c', 'b.type_id = c.id', 'left')
            ->join('admin a', 'a.id = b.user_id', 'left')
            ->where($where)
            ->order('create_time desc')
            ->limit(3)
            ->select();
        return to_assign(0, '', $data);
    }

}