<?php

namespace app\teach\controller;

use think\facade\Db;
use think\facade\View;

class Type
{
    public function index()
    {
        return view();
    }

    public function data()
    {
        $param = get_params();
        $where=[];
        if (!empty($param['keywords'])) {
            $where[] = ['type_name', 'like', '%' . $param['keywords'] . '%'];
        }
        //获取所有图书类别信息，并获得每个类别下有几本图书
        $data = Db::name('book_type')
            ->alias('a')
            ->join('book b', 'a.id=b.type_id', 'left')
            ->field('a.*,count(b.id) as book_count')
            ->group('a.id')
            ->order('a.type_name', 'asc')
            ->select();
        /*$data = Db::name('book_type')
            ->where($where)
            ->order('type_name', 'asc')
            ->select();*/
        //统计每一个类别下有几本图书
       /* $data->each(function ($item, $key) {
            $item['book_count'] = Db::name('book')->where(['type_id' => $item['id']])->count();
            return $item;
        });*/
        return to_assign(0, '', $data);
    }

    public function add()
    {
        return view();
    }

    public function edit()
    {
        $id = get_params("id");
        $data = Db::name('book_type')->where(['id' => $id])->find();
        View::assign('data', $data);
        return view();
    }

    public function save()
    {
        $param = get_params();
        if (!empty($param['id']) && $param['id'] > 0) {  //当前操作是编辑保存
            $where = array();
            $where[] = ['type_name', '=', $param['type_name']];
            $where[] = ['id', '<>', $param['id']];
            $count = Db::name('book_type')->where($where)->count();
            if ($count > 0)
                return to_assign(1, '操作失败，原因：该类别已经存在');
            Db::name('book_type')->where('id', $param['id'])->strict(false)->update($param);  //strict此处可以不加，详见https://doc.thinkphp.cn/v8_0/strict.html
            return to_assign();
        } else {   //当前操作是新建保存
            $count = Db::name('book_type')->where('type_name', '=', $param['type_name'])->count();
            if ($count > 0)
                return to_assign(1, '操作失败，原因：该类别已经存在');

            /*$type_name = Db::name('BookType')->where(['type_name' => $param['username']])->find();
            if (empty($type_name))
                return to_assign(1, '操作失败，原因：该类别已经存在');*/

            $param['create_time'] = time();
            Db::name('book_type')->insert($param);
            return to_assign();
        }
    }

    //删除
    public function delete()
    {
        $param = get_params();
        $where = [
            ['type_id', '=', $param['id']]
            //,['type_id', '<>', $param['type_id']]
        ];
        $count = Db::name('book')->where($where)->count();
        if ($count > 0) {
            return to_assign(1, "该类别下还有图书，无法删除");
        }
        if (Db::name('BookType')->delete($param['id']) !== false) {
            return to_assign(0, "删除类别成功");
        } else {
            return to_assign(1, "删除失败");
        }
    }
}