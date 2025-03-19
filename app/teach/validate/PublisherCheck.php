<?php

namespace app\teach\validate;

use think\Validate;

class PublisherCheck extends Validate
{
    protected $rule = [
        'name' => 'require|unique:book_publisher',
        'sort'=>'require',
        'id' => 'require',
    ];

    protected $message = [
        'name.require' => '出版社名称不能为空',
        'name.unique' => '同样的出版社名称已经存在',
        'sort.require' => '排序不能为空',
        'id.require' => '缺少更新条件',
    ];

    protected $scene = [
        'add' => ['name','sort'],
        'edit' => ['id','name','sort'],
    ];
}
