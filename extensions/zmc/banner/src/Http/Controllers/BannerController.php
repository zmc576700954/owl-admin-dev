<?php

namespace Zmc\Banner\Http\Controllers;

use Zmc\Banner\BannerServiceProvider;
use Zmc\Banner\Services\BannerCategorieService;
use Zmc\Banner\Services\BannerService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 轮播图设置
 *
 * @property BannerService $service
 */
class BannerController extends AdminController
{
	protected string $serviceName = BannerService::class;

	public function list()
	{
		$crud = $this->baseCRUD()
			->filterTogglable(false)
			->headerToolbar([
				$this->createButton('dialog'),
				...$this->baseHeaderToolBar()
			])
			->columns([
				amis()->TableColumn('id', 'ID')->sortable(),
				amis()->TableColumn('banner_categories.name', $this->trans('category_name')),
				amis()->TableColumn('title', $this->trans('title')),
				amis()->TableColumn('url', $this->trans('url'))->type('image')->src('${url}'),
				amis()->TableColumn('sort', $this->trans('sort'))->sortable(),
				amis()->TableColumn('created_at', admin_trans('admin.created_at'))->type('datetime')->sortable(),
				amis()->TableColumn('updated_at', admin_trans('admin.updated_at'))->type('datetime')->sortable(),
				$this->rowActions('dialog')
			]);

		return $this->baseList($crud);
	}

	public function form($isEdit = false)
	{
		return $this->baseForm()->body([
			amis()->SelectControl('category_id', $this->trans('category_name'))
                ->source(admin_url('/banner_categories/bannerCategory'))
                ->clearable()
                ->required()
                ->valueField('id')
                ->labelField('name'),
			amis()->TextControl('title', $this->trans('title'))
                ->required(),
            amis()->ImageControl('url', $this->trans('url'))
                ->receiver($this->uploadImagePath())
                ->required(),
			amis()->TextControl('sort', $this->trans('sort')),
		]);
	}

	public function detail()
	{
		return $this->baseDetail()->body([
			amis()->TextControl('id', 'ID')->static(),
			amis()->TextControl('banner_categories.name', $this->trans('category_name'))->static(),
			amis()->TextControl('title', $this->trans('title'))->static(),
			amis()->TextControl('url', $this->trans('url'))->static(),
			amis()->TextControl('sort', $this->trans('sort'))->static(),
			amis()->TextControl('created_at', admin_trans('admin.created_at'))->static(),
			amis()->TextControl('updated_at', admin_trans('admin.updated_at'))->static(),
		]);
	}

    private function trans($key)
    {
        return BannerServiceProvider::trans('zmc-banner.' . $key);
    }
}
