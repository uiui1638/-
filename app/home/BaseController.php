<?php
/**
 * 
 * @license https://opensource.org/licenses/Apache-2.0
 * 
 */

declare (strict_types = 1);

namespace app\home;

use think\App;
use think\facade\View;
use think\exception\HttpResponseException;

/**
 * 控制器基础类
 */
abstract class BaseController
{
    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;

    /**
     * 是否批量验证
     * @var bool
     */
    protected $batchValidate = false;

    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [];

    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
    public function __construct(App $app)
    {
        $this->app = $app;
        $this->request = $this->app->request;
        // 控制器初始化
        $this->initialize();
    }

    // 初始化
    protected function initialize()
    {
        $params = [
            'module' => \think\facade\App::initialize()->http->getName(),
            'controller' => app('request')->controller(),
            'action' => app('request')->action(),
            'isLogin' => 0,
            'uid' => 0,
            'nickname' => '',
            'mobile_status' => 0,
            'version' => get_config('webconfig.version'),
        ];
		// 加载控制器语言包
		$lang = cookie('think_lang');
		if(empty($lang)){
			$lang = 'zh-cn';
		}
		\think\facade\Lang::setLangSet($lang);
        $langset = $this->app->lang->getLangSet();
        $this->app->lang->load([
            app_path() . 'lang/' . $langset . '.php'
        ]);
		
        $login_top = '';
        $info = $this->checkLogin();
        if ($info) {
            $login_top = '<a class="nav-img" href="/home/user/index"><img src="' . $info['headimgurl'] . '" alt="' . $info['username'] . '" />' . $info['username'] . '</a>';
            $params['isLogin'] = 1;
            $params['uid'] = $info['id'];
            $params['nickname'] = $info['nickname'];
            $params['username'] = $info['username'];
        }
        $COMMON_NAV = get_navs('NAV_HOME');
        View::assign('COMMON_NAV', $COMMON_NAV);
        View::assign('webconfig', get_config('webconfig'));
        View::assign('params', $params);
        View::assign('login_top', $login_top);
    }
    // 检测用户登录状态
    protected function checkLogin()
    {
        $session_user = get_config('app.session_user');
        $login_user = \think\facade\Session::get($session_user);
        if ($login_user && is_array($login_user)) {
            return $login_user;
        } else {
            return false;
        }
    }
	//页面跳转方法
	public function redirectTo(...$args)
    {
        throw new HttpResponseException(redirect(...$args));
    }
}
