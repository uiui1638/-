<?php

namespace app\tyh1\controller;

use think\facade\Db;
use think\facade\Request;
use think\facade\View;
class admin
{
    public function bonus_item()
    {
        if (request()->isAjax()) {
            $list = Db::name('bonus_item')

                ->select();
            return to_assign(0, '', $list);


        } else {
            return view();
        }
    }
    public function add_bonus()
    {
        if (request()->isAjax()) {
            $data = get_params();
            $data['responsible_person'] = get_login_admin('nickname');

            // 根据选择的加分项名称获取加分项ID
            $bonusName = $data['name'];
            $bonusItem = Db::name('bonus_item')->where('name', $bonusName)->find();
            if ($bonusItem) {
                $data['bonus_item_id'] = $bonusItem['id'];
            } else {
                return to_assign('加分项名称不存在');
            }

            // 计算总加分分数值
            $data['score'] = $bonusItem['score'] * $bonusItem['weight'];

            Db::name('student_bonus')->strict(false)->insert($data);
            return to_assign(['code' => 1, 'msg' => '添加成功']);
        } else {
            // 获取所有加分项的名称和ID
            $bonusItemList = Db::name('bonus_item')->select()->toArray(); // 将 Collection 转换为数组
            $bonusItemList = array_column($bonusItemList, 'name', 'id');
            View::assign('bonusItemList', $bonusItemList);  // 将加分项列表传递给前台
            return view();
        }
    }
    public function edit_bonus()
    {
        if (request()->isAjax()) {
            $data = input('post.');
            $result = Db::name('bonus_item')->update($data);
            if ($result !== false) {
                return to_assign();
            } else {
                return to_assign(1, '更新失败');
            }
        } else {
            $id = input('param.id');
            $record = Db::name('bonus_item')->find($id);
            View::assign('record', $record);
            return view('edit_bonus');
        }
    }
    public function delete_bonus()
    {
        $id = get_params('id');

        // 检查 student_bonus 表中是否存在引用该 bonus_item 的记录
        $isReferenced = Db::name('student_bonus')->where(['bonus_item_id' => $id])->find();

        if ($isReferenced) {
            // 如果存在引用，返回错误信息
            return to_assign(1, '该加分项正在被使用，无法删除');
        }

        // 构建删除条件
        $where = ['id' => $id];

        // 执行删除操作
        Db::name('bonus_item')->where($where)->delete();

        // 返回成功信息
        return to_assign(0, '删除成功');
    }


    public function bonus()
    {
        $name = get_login_admin('nickname');
        if (request()->isAjax()) {

            $list = Db::name('student_bonus')
                ->alias('sb')
                ->join('student st', 'sb.student_id = st.student_id', 'LEFT') // 左连接 student 表
                ->join('bonus_item bi', 'sb.bonus_item_id = bi.bonus_item_id', 'LEFT') // 左连接 bonus_item 表
                ->field('st.name as student_name, bi.name as bonus_name, sb.*')
                ->where('sb.status', 0)// 选择所需字段
                ->select();
            return to_assign(0, '', $list);

        }else{
            return view();
        }

    }

    public function get_average()
    {
        if (request()->isAjax()) {
            // 计算每个学生的平均成绩
            $averages = Db::name('student_bonus')
                ->alias('sb')
                ->join('student st', 'sb.student_id = st.id', 'LEFT')
                ->where('sb.status', 1)
                ->field('st.name as student_name, AVG(sb.score) as average_score')
                ->group('st.id')
                ->select();

            return to_assign(0, '', $averages);
        } else {
            return view();
        }
    }



    public function audit()
    {
        $id = get_params('id');
        $status = get_params('status');
        Db::name('student_bonus')->where('id', 'in', $id)->update(['status' => $status]);
        return to_assign();
    }


    public function student_bonus_list()
    {
        if (request()->isAjax()) {
            // 使用子查询计算奖学金等级
            $students = Db::name('student')
                ->alias('s')
                ->join('student_bonus sb', 's.id = sb.student_id', 'LEFT')
                ->join('bonus_item bi', 'sb.bonus_item_id = bi.id', 'LEFT')
                ->field([
                    's.id',
                    's.name',
                    'SUM(sb.score * bi.weight) as total_score',
                    '(CASE 
                WHEN SUM(sb.score * bi.weight) >= 15 THEN "一等奖学金"
                WHEN SUM(sb.score * bi.weight) >= 10 THEN "二等奖学金"
                WHEN SUM(sb.score * bi.weight) >= 5 THEN "三等奖学金"     
                ELSE "无奖学金"
             END) as scholarship'
                ])
                ->group('s.id')
                ->select();

            // 返回数据
            return to_assign(0, '', $students);
        } else {
            return view();
        }
    }

    public function student_bonus_details()
    {
        if (request()->isAjax()) {
            $studentId = input('param.student_id');

            // 查询该学生的具体加分项
            $list = Db::name('student_bonus')
                ->alias('sb')
                ->join('bonus_item bi', 'sb.bonus_item_id = bi.id')
                ->where('sb.student_id', $studentId)
                ->field('bi.name as bonus_item_name, bi.score as bonus_item_score')
                ->select();

            // 返回数据
            return json(['code' => 0, 'msg' => '', 'data' => $list]);
        } else {
            return view();
        }
    }











}