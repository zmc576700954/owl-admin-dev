<?php

namespace Zmc\Banner\Http\Controllers;

use Zmc\Banner\BannerServiceProvider;
use Zmc\Banner\Services\BannerCategorieService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 轮播图分类
 *
 * @property BannerCategorieService $service
 */
class BannerCategorieController extends AdminController
{
	protected string $serviceName = BannerCategorieService::class;

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
				amis()->TableColumn('name', $this->trans('name')),
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
			amis()->TextControl('name', $this->trans('name'))
                ->required(),
			amis()->TextControl('sort', $this->trans('sort')),
		]);
	}

	public function detail()
	{
		return $this->baseDetail()->body([
			amis()->TextControl('id', 'ID')->static(),
			amis()->TextControl('name', $this->trans('name'))->static(),
			amis()->TextControl('sort', $this->trans('sort'))->static(),
			amis()->TextControl('created_at', admin_trans('admin.created_at'))->static(),
			amis()->TextControl('updated_at', admin_trans('admin.updated_at'))->static(),
		]);
	}

    private function trans($key)
    {
        return BannerServiceProvider::trans('zmc-banner.' . $key);
    }

    public function categoryList()
    {
        return $this->response()->success($this->service->categoryList());
    }
}
