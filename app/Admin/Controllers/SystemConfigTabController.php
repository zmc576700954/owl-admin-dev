<?php

namespace App\Admin\Controllers;

use App\Services\SystemConfigTabService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 配置分类
 *
 * @property SystemConfigTabService $service
 */
class SystemConfigTabController extends AdminController
{
	protected string $serviceName = SystemConfigTabService::class;

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
				amis()->TableColumn('is_store', '0=总后台,1=门店'),
				amis()->TableColumn('pid', '上级分类id')->sortable(),
				amis()->TableColumn('title', '配置分类名称'),
				amis()->TableColumn('eng_title', '配置分类英文名称'),
				amis()->TableColumn('status', '配置分类状态'),
				amis()->TableColumn('info', '配置分类是否显示'),
				amis()->TableColumn('icon', '图标'),
				amis()->TableColumn('type', '配置类型')->sortable(),
				amis()->TableColumn('sort', '排序')->sortable(),
				$this->rowActions('dialog')
			]);

		return $this->baseList($crud);
	}

	public function form($isEdit = false)
	{
		return $this->baseForm()->body([
			amis()->TextControl('is_store', '0=总后台,1=门店'),
			amis()->TextControl('pid', '上级分类id'),
			amis()->TextControl('title', '配置分类名称'),
			amis()->TextControl('eng_title', '配置分类英文名称'),
			amis()->TextControl('status', '配置分类状态'),
			amis()->TextControl('info', '配置分类是否显示'),
			amis()->TextControl('icon', '图标'),
			amis()->TextControl('type', '配置类型'),
			amis()->TextControl('sort', '排序'),
		]);
	}

	public function detail()
	{
		return $this->baseDetail()->body([
			amis()->TextControl('id', 'ID')->static(),
			amis()->TextControl('is_store', '0=总后台,1=门店')->static(),
			amis()->TextControl('pid', '上级分类id')->static(),
			amis()->TextControl('title', '配置分类名称')->static(),
			amis()->TextControl('eng_title', '配置分类英文名称')->static(),
			amis()->TextControl('status', '配置分类状态')->static(),
			amis()->TextControl('info', '配置分类是否显示')->static(),
			amis()->TextControl('icon', '图标')->static(),
			amis()->TextControl('type', '配置类型')->static(),
			amis()->TextControl('sort', '排序')->static(),
		]);
	}
}