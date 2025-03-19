<?php
/**
 * 
 * @license https://opensource.org/licenses/Apache-2.0
 * 
 */

namespace app\teach\validate;

use think\Validate;

class UserCheck extends Validate
{
    protected $rule = [
        'username' => 'require|unique:admin',
        'pwd' => 'require|min:1|confirm',
        'nickname' => 'require',
        'group_id' => 'require',
        'id' => 'require'
    ];

    protected $message = [
        'username.require' => '用户名不能为空',
        'username.unique' => '同样的用户名已经存在',
        'pwd.require' => '密码不能为空',
        'pwd.confirm' => '两次密码不一致',
        'group_id.require' => '至少要选择一个用户角色',
        'id.require' => '缺少更新条件'
    ];

    protected $scene = [
        'add' => ['nickname', 'group_id', 'pwd', 'username'],
        'edit' => ['nickname', 'group_id', 'id', 'username'],
    ];


}
