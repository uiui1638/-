<?php

namespace app\tyh\controller;

use think\facade\Db;
use think\facade\Request;
use think\facade\View;

class tree
{
    public function tree()
    {
        if (request()->isAjax()) {
            $list = Db::name('tree')

                ->select();
            return to_assign(0, '', $list);


        } else {
            return view();
        }
    }
    public function s()
    {
        if (request()->isAjax()) {
            $list = Db::name('species')
//
                ->select();
            return to_assign(0, '', $list);


        } else {
            return view();
        }
    }

    public function location()
    {
        if (request()->isAjax()) {
            $list = Db::name('location')

                ->select();
            return to_assign(0, '', $list);


        } else {
            return view();
        }
    }

    public function add_location()
    {
        if (request()->isAjax()) {
            $data=get_params();
            Db::name('location')->strict(false)->insert($data);
              return to_assign();
//            $species_id=$data['id'];
//            $res=Db::name('location')->where('id',$species_id)->find();
//            if($res==null){
//                Db::name('location')->strict(false)->insert($data);
//                return to_assign();
//            }
//            else{
//                return to_assign(1,'位置号已存在');
//            }

        } else {
            $list=Db::name('location')->select();
            View::assign('type',$list);  //将$list返回给前台的type变量
            return view();
        }
    }

    public function add_species()
    {
        if (request()->isAjax()) {
            $data=get_params();
            Db::name('species')->strict(false)->insert($data);
            return to_assign();
//            $species_id=$data['id'];
//            $res=Db::name('species')->where('id',$species_id)->find();
//            if($res==null){
//                Db::name('species')->strict(false)->insert($data);
//                return to_assign();
//            }
//            else{
//                return to_assign(1,'种类已存在');
//            }

        } else {
            $list=Db::name('species')->select();
            View::assign('type',$list);  //将$list返回给前台的type变量
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
            Db::name('records')->strict(false)->insert($data);
            return to_assign();
//            $record_id=$data['id'];
//            $res=Db::name('records')->where('id',$record_id)->find();
//            if($res==null){
//                Db::name('records')->strict(false)->insert($data);
//                return to_assign();
//            }
//            else{
//                return to_assign(1,'记录id已存在');
//            }

        } else {
            $list=Db::name('species')->select();
            View::assign('type',$list);  //将$list返回给前台的type变量
            return view();
        }
    }

    public function record()
    {
        if (request()->isAjax()) {
            $list = Db::name('records')
//         ->leftJoin('species', 'tree.species_id = species.species_id')
//           ->leftJoin('location', 'tree.location_id = location.location_id')
                ->select();
            return to_assign(0, '', $list);


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

    public function add_tree()
    {

        if (request()->isAjax()) {
            $data=get_params();
            Db::name('tree')->strict(false)->insert($data);
                return to_assign();
//            $tree_id=$data['id'];
//            $res=Db::name('tree')->where('id',$tree_id)->find();
//            if($res==null){
//                Db::name('tree')->strict(false)->insert($data);
//                return to_assign();
//            }
//            else{
//                return to_assign(1,'树已存在');
//            }

        } else {
            $list=Db::name('tree')->select();
            View::assign('type',$list);  //将$list返回给前台的type变量
            return view();
        }
    }


    public function edit_tree()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('tree')->update($data);
            if ($result !== false) {
                return to_assign('更新成功');
            } else {
                return to_assign(1, '更新失败');
            }
        } else {
            $id = input('param.id');
            $record = Db::name('tree')->find($id);
            View::assign('record', $record);
            return view('edit_tree');
        }
    }
//

    public function edit_Location()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('location')->update($data);
            if ($result !== false) {
                return to_assign('更新成功');
            } else {
                return to_assign(1, '更新失败');
            }
        } else {
            $id = input('param.id');
            $record = Db::name('location')->find($id);
            View::assign('record', $record);
            return view('edit_location');
        }
    }

    public function edit_species()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('species')->update($data);
            if ($result !== false) {
                return to_assign('更新成功');
            } else {
                return to_assign(1, '更新失败');
            }
        } else {
            $id = input('param.id');
            $record = Db::name('species')->find($id);
            View::assign('record', $record);
            return view('edit_species');
        }
    }

    public function edit_healthcheck()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('healthcheck')->update($data);
            if ($result !== false) {
                return to_assign('更新成功');
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
                return to_assign( '更新成功');
            } else {
                return to_assign(1,  '更新失败');
            }
        } else {
            $id = input('param.id');
            $record = Db::name('records')->find($id);
            View::assign('record', $record);
            return view('edit_record');
        }
    }


    public function delete_tree()
    {
//        $id = get_params('id');
//        $where = [];
//        $where['tree_id'] = $id;
//        Db::name('tree')->where($where)->delete();
//        return to_assign(0, '删除成功');
        // 获取要删除的 tree 的 id
        $id = get_params('id');

        // 检查 records 表中是否存在引用该 tree 的记录
        $isReferencedInRecords = Db::name('records')->where(['tree_id' => $id])->find();

        // 检查 healthcheck 表中是否存在引用该 tree 的记录
        $isReferencedInHealthcheck = Db::name('healthcheck')->where(['tree_id' => $id])->find();

        if ($isReferencedInRecords || $isReferencedInHealthcheck) {
            // 如果存在引用，返回错误信息
            return to_assign(1, '该树正在被使用，无法删除');
        }

        // 构建删除条件
        $where = ['id' => $id];

        // 执行删除操作
        Db::name('tree')->where($where)->delete();

        // 返回成功信息
        return to_assign(0, '删除成功');
    }
    public function delete_location()
    {
//        $id = get_params('id');
//        $where = [];
//        $where['id'] = $id;
//        Db::name('location')->where($where)->delete();
//        return to_assign(0, '删除成功');

        // 获取要删除的 location 的 id
        $id = get_params('id');

        // 检查 tree 表中是否存在引用该 location 的记录
        $isReferenced = Db::name('tree')->where(['location_id' => $id])->find();

        if ($isReferenced) {
            // 如果存在引用，返回错误信息
            return to_assign(1, '该位置正在被使用，无法删除');
        }

        // 构建删除条件
        $where = ['id' => $id];

        // 执行删除操作
        Db::name('location')->where($where)->delete();

        // 返回成功信息
        return to_assign(0, '删除成功');


    }

    public function delete_species()
    {
//        $id = get_params('id');
//        $where = [];
//        $where['id'] = $id;
//        Db::name('species')->where($where)->delete();
//        return to_assign(0, '删除成功');
        $id = get_params('id');

        // 检查 tree 表中是否存在引用该 location 的记录
        $isReferenced = Db::name('tree')->where(['species_id' => $id])->find();

        if ($isReferenced) {
            // 如果存在引用，返回错误信息
            return to_assign(1, '该位置正在被使用，无法删除');
        }

        // 构建删除条件
        $where = ['id' => $id];

        // 执行删除操作
        Db::name('species')->where($where)->delete();

        // 返回成功信息
        return to_assign(0, '删除成功');
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



    public function audit()
    {
        $id = get_params('id');
        $status = get_params('status');
        Db::name('records')->where('id', 'in', $id)->update(['status' => $status]);
        return to_assign();
    }



}
