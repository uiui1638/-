<?php

namespace app\tyh\controller;
use think\facade\Db;
use think\facade\Request;
use think\facade\View;
class Why2
{
    public function record()
    {
        $name = get_login_admin('nickname');
        if (request()->isAjax()) {

            $list = Db::name('records')
                ->alias('r')
                ->join('tree t', 'r.tree_id = t.id', 'LEFT') // 左连接 tree 表
                ->join('species s', 't.species_id = s.id', 'LEFT') // 左连接 species 表
                ->field('r.*, s.species_name as tree_name') // 选择 records 表的所有字段和 species 表的 species_name 字段
                ->where('r.status', 1);
            // 判断当前登录用户是否为 'why'
            if ($name == 'why2') {
                // 查询 responsible_person 为 'why' 的所有记录
                $list = $list->where('r.responsible_person', 'why2')->select();
                return to_assign(0, '', $list);
            } else {
                // 如果不是 'why' 用户，可以根据需要返回其他数据或空列表
                return to_assign(0, '', []);
            }
        } else {
            return view();
        }
    }


    public function healthcheck()
    {
        if (request()->isAjax()) {
            $list = Db::name('healthcheck')
                ->alias('h')
                ->join('tree t', 'h.tree_id = t.id')
                ->join('species s', 't.species_id = s.id')
                ->field('h.*, s.species_name as tree_name')
                ->select();
            return to_assign(0, '', $list);


        } else {
            return view();
        }
    }

    public function add_healthcheck()
    {
        if (request()->isAjax()) {
            $data = get_params();
            Db::name('healthcheck')->strict(false)->insert($data);
            return to_assign();
        } else {
            // 查询 tree 表和 species 表，获取树木名称
            $trees = Db::name('tree')
                ->alias('t')
                ->join('species s', 't.species_id = s.id')
                ->field('t.id, s.species_name')
                ->select();

            View::assign('trees', $trees);  // 将$trees返回给前台的trees变量
            return view();
        }
    }
    public function add_record()
    {
        if (request()->isAjax()) {
            $data=get_params();
            $data['responsible_person']=get_login_admin('nickname');
            //根据选择的 tree_name 获取 tree_id
            $treeName = $data['tree_name'];
            $species = Db::name('species')->where('species_name', $treeName)->find();
            if ($species) {
                $tree = Db::name('tree')->where('species_id', $species['id'])->find();
                if ($tree) {
                    $data['tree_id'] = $tree['id'];
                } else {
                    return to_assign('树木不存在');
                }
            } else {
                return to_assign( '树木名称不存在');
            }

            Db::name('records')->strict(false)->insert($data);
            return to_assign(1, '添加成功');
        } else {
            // 获取所有树木的 species_name 和 species_id
            $speciesList = Db::name('species')->select();
            $treeList = [];
            foreach ($speciesList as $species) {
                $treeList[$species['id']] = $species['species_name'];
            }
            View::assign('treeList', $treeList);  // 将树列表传递给前台
            return view();
        }
    }






    public function edit_healthcheck()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('healthcheck')->update($data);
            if ($result !== false) {
                return to_assign( '更新成功');
            } else {
                return to_assign(1, '更新失败');
            }
        } else {
            $id = input('param.id');
            $record = Db::name('healthcheck')->find($id);
            View::assign('record', $record);
            return view('edit_healthcheck');
        }
    }

    public function edit_record()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('records')->update($data);
            if ($result !== false) {
                return to_assign('更新成功');
            } else {
                return to_assign(1, '更新失败');
            }
        } else {
            $id = input('param.id');
            $record = Db::name('records')->find($id);
            View::assign('record', $record);
            return view('edit_record');
        }
    }

    public function delete_healthcheck()
    {
        $id = get_params('id');
        $where = [];
        $where['id'] = $id;
        Db::name('healthcheck')->where($where)->delete();
        return to_assign(0, '删除成功');
    }
    public function delete_record()
    {
        $id = get_params('id');
        $where = [];
        $where['id'] = $id;
        Db::name('records')->where($where)->delete();
        return to_assign(0, '删除成功');
    }




}