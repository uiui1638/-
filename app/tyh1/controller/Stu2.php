<?php

namespace app\tyh1\controller;
use think\facade\Db;
use think\facade\Request;
use think\facade\View;
class Stu2
{
    public function bonus()
    {
        $name = get_login_admin('nickname');
        if (request()->isAjax()) {

            $list = Db::name('student_bonus')
                ->alias('sb')
                ->join('student st', 'sb.student_id = st.student_id', 'LEFT') // 左连接 student 表
                ->join('bonus_item bi', 'sb.bonus_item_id = bi.bonus_item_id', 'LEFT') // 左连接 bonus_item 表
                ->field('st.name as student_name, bi.name as bonus_name, sb.*')
                ->where('sb.status', 1);// 选择所需字段
            //->where('st.name', 'stu1'); // 过滤学生姓名为 'stu1' 的记录

            if ($name == 'stu2') {
                // 显示 status 为已通过和未通过的数据
                $list = $list->where('st.name', 'stu2')->select();
                return to_assign(0, '', $list);
            } else {
                // 如果不是 'stu1' 用户，可以根据需要返回其他数据或空列表
                return to_assign(0, '', []);
            }
        } else {
            return view();
        }
    }

    public function add_bonus()
    {
        if (request()->isAjax()) {
            $data = get_params();

            // 根据选择的学生姓名获取 student_id
            $studentName = $data['student_name'];
            $student = Db::name('student')->where('name', $studentName)->find();
            if ($student) {
                $data['student_id'] = $student['student_id'];
            } else {
                return to_assign('学生不存在');
            }

            // 根据选择的加分项名称获取 bonus_item_id 和 score
            $bonusItemName = $data['bonus_item_name'];
            $bonusItem = Db::name('bonus_item')->where('name', $bonusItemName)->find();
            if ($bonusItem) {
                $data['bonus_item_id'] = $bonusItem['bonus_item_id'];
                $data['score'] = $bonusItem['score']; // 自动填充加分值
            } else {
                return to_assign('加分项不存在');
            }

            // 插入数据
            Db::name('student_bonus')->strict(false)->insert($data);
            return to_assign(1, '添加成功');
        } else {
            // 获取所有学生和加分项的名称和 ID
            $studentList = Db::name('student')->select();
            $bonusItemList = Db::name('bonus_item')->select();

            $students = [];
            foreach ($studentList as $student) {
                $students[$student['student_id']] = $student['name'];
            }

            $bonusItems = [];
            foreach ($bonusItemList as $bonusItem) {
                $bonusItems[$bonusItem['bonus_item_id']] = $bonusItem['name'];
            }

            View::assign('students', $students);  // 将学生列表传递给前台
            View::assign('bonusItems', $bonusItems);  // 将加分项列表传递给前台
            return view();
        }
    }
    public function edit_bonus()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('student_bonus')->update($data);
            if ($result !== false) {
                return json(['code' => 0, 'msg' => '更新成功']);
            } else {
                return json(['code' => 1, 'msg' => '更新失败']);
            }
        } else {
            $id = input('param.id');
            $bonus = Db::name('student_bonus')
                ->alias('sb')
                ->join('student s', 'sb.student_id = s.id')
                ->join('bonus_item bi', 'sb.bonus_item_id = bi.id')
                ->field('sb.id, s.name as student_name, bi.name as bonus_name, sb.score, sb.status')
                ->where('sb.id', $id)
                ->find();
            View::assign('bonus', $bonus);
            return view('edit_bonus');
        }
    }


    public function delete_bonus()
    {
        $id = get_params('id');
        $where = [];
        $where['id'] = $id;
        Db::name('student_bonus')->where($where)->delete();
        return to_assign(0, '删除成功');
    }

}