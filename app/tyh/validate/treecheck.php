<?php

namespace app\tyh\validate;
use think\Validate;
class treecheck extends Validate
{
    protected $rule = [
        'id'            => 'require|unique:tree',
        'species_id'    => 'require',
        'planting_date' => 'require|date',
        'location_id'   => 'require',
        'health_status' => 'require'
    ];

    protected $message = [
        'id.require'            => 'ID 不能为空',
        'id.unique'             => 'ID 已存在',
        'species_id.require'    => '物种ID 不能为空',
        'planting_date.require' => '种植日期 不能为空',
        'planting_date.date'    => '种植日期 格式不正确',
        'location_id.require'   => '位置ID 不能为空',
        'health_status.require' => '健康状态 不能为空',

    ];

    protected $scene = [
        'add' => [
            'id',
            'species_id',
            'planting_date',
            'location_id',
            'health_status'
        ]
    ];

}