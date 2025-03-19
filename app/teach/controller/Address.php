<?php

namespace app\teach\controller;

use app\teach\BaseController;
use think\facade\Db;
use think\facade\View;

class Address extends BaseController
{
    public function index()
    {
        if (request()->isAjax()) {
            $where[]=['user_id','=',get_login_admin('id')];
            $list = Db::name('book_address')
                ->where($where)
                ->select();
            return to_assign(0, '', $list);
        } else {
            return view();
        }
    }

    public function add(){
        if (request()->isAjax()) {
            $param = get_params();
            $param['user_id']=get_login_admin('id');
            $param['address']=$param['province'].$param['city'].$param['address'];
            Db::name('book_address')->strict(false)->insert($param);
            return to_assign(0, '操作成功！');
        } else {
            $province=Db::name('book_city')->where(['pid'=>0])->select();
            View::assign('province',$province);
            return view();
        }
    }

    public function edit()
    {
        $param = get_params();
        Db::execute('update cms_book_address set is_default="0" where user_id='.get_login_admin('id'));
        Db::name('book_address')->update($param);
        return to_assign();
    }

    public function search()
    {
        $pid = get_params('pid');
        $data = Db::name('book_city')->field('name')->where('pid', $pid)->select();
        return $data;
    }

    public function delete(){
        $id = get_params('id');
        Db::name('book_address')->delete($id);
        return to_assign();
    }
}