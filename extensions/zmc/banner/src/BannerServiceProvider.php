<?php

namespace Zmc\Banner;

use Slowlyo\OwlAdmin\Renderers\TextControl;
use Slowlyo\OwlAdmin\Extend\ServiceProvider;

class BannerServiceProvider extends ServiceProvider
{
    protected $menu = [
        [
            'title'    => '轮播图管理',
            'url'      => '/banner',
            'url_type' => '1',
            'icon'     => 'bi:images',
        ],
        [
            'parent'   => '轮播图管理', // 此处父级菜单根据 title 查找
            'title'    => '轮播图分类',
            'url'      => '/banner_categories',
            'url_type' => '1',
            'icon'     => 'ph:images-square',
        ],
        [
            'parent'   => '轮播图管理', // 此处父级菜单根据 title 查找
            'title'    => '轮播图设置',
            'url'      => '/banners',
            'url_type' => '1',
            'icon'     => 'ph:image-fill',
        ],
    ];

    public function register()
    {
        parent::register();
    }


	public function settingForm()
	{
	    return $this->baseSettingForm()->body([
            amis()->SwitchControl('delete_banner', '开启真实删除')->description('开启后分类和轮播图都会真实删除'),
	    ]);
	}
}
