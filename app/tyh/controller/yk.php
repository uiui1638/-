<?php

namespace app\tyh\controller;
use think\facade\Db;
use think\facade\Request;
use think\facade\View;
class yk
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

    public function get_tree_info()
    {
        // 获取要查询的 tree 的 id
        $id = get_params('id');

        // 构建查询条件
        $where = ['id' => $id];

        // 执行查询操作
        $treeInfo = Db::name('tree')->where($where)->find();

        if ($treeInfo) {
            // 如果查询到记录，返回成功信息及数据
            return to_assign(0, '查询成功', $treeInfo);
        } else {
            // 如果没有查询到记录，返回错误信息
            return to_assign(1, '未找到相关记录');
        }
    }

}