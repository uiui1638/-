<?php
/**
 * 
 * @license https://opensource.org/licenses/Apache-2.0
 * 
 */

declare (strict_types = 1);

namespace app\test\controller;

use app\admin\BaseController;
use think\facade\Db;
use think\facade\View;

class Index extends BaseController
{
    public function index()
    {
		return "hello world";
    }


}
