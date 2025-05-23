<?php

namespace App\Admin\Controllers;

use App\Services\SystemConfigService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 配置项
 *
 * @property SystemConfigService $service
 */
class SystemConfigController extends AdminController
{
	protected string $serviceName = SystemConfigService::class;

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
				amis()->TableColumn('menu_name', '字段名称'),
				amis()->TableColumn('type', '类型(文本框,单选按钮...)'),
				amis()->TableColumn('input_type', '表单类型'),
				amis()->TableColumn('config_tab_id', '配置分类id'),
				amis()->TableColumn('parameter', '规则 单选框和多选框'),
				amis()->TableColumn('upload_type', '上传文件格式1单图2多图3文件'),
				amis()->TableColumn('required', '规则'),
				amis()->TableColumn('width', '多行文本框的宽度')->sortable(),
				amis()->TableColumn('high', '多行文框的高度')->sortable(),
				amis()->TableColumn('value', '默认值'),
				amis()->TableColumn('info', '配置名称'),
				amis()->TableColumn('desc', '配置简介'),
				amis()->TableColumn('sort', '排序')->sortable(),
				amis()->TableColumn('status', '是否隐藏'),
				$this->rowActions('dialog')
			]);

		return $this->baseList($crud);
	}

	public function form($isEdit = false)
	{
		return $this->baseForm()->body([
			amis()->TextControl('is_store', '0=总后台,1=门店'),
			amis()->TextControl('menu_name', '字段名称'),
			amis()->TextControl('type', '类型(文本框,单选按钮...)'),
			amis()->TextControl('input_type', '表单类型'),
			amis()->TextControl('config_tab_id', '配置分类id'),
			amis()->TextControl('parameter', '规则 单选框和多选框'),
			amis()->TextControl('upload_type', '上传文件格式1单图2多图3文件'),
			amis()->TextControl('required', '规则'),
			amis()->TextControl('width', '多行文本框的宽度'),
			amis()->TextControl('high', '多行文框的高度'),
			amis()->TextControl('value', '默认值'),
			amis()->TextControl('info', '配置名称'),
			amis()->TextControl('desc', '配置简介'),
			amis()->TextControl('sort', '排序'),
			amis()->TextControl('status', '是否隐藏'),
		]);
	}

	public function detail()
	{
		return $this->baseDetail()->body([
			amis()->TextControl('id', 'ID')->static(),
			amis()->TextControl('is_store', '0=总后台,1=门店')->static(),
			amis()->TextControl('menu_name', '字段名称')->static(),
			amis()->TextControl('type', '类型(文本框,单选按钮...)')->static(),
			amis()->TextControl('input_type', '表单类型')->static(),
			amis()->TextControl('config_tab_id', '配置分类id')->static(),
			amis()->TextControl('parameter', '规则 单选框和多选框')->static(),
			amis()->TextControl('upload_type', '上传文件格式1单图2多图3文件')->static(),
			amis()->TextControl('required', '规则')->static(),
			amis()->TextControl('width', '多行文本框的宽度')->static(),
			amis()->TextControl('high', '多行文框的高度')->static(),
			amis()->TextControl('value', '默认值')->static(),
			amis()->TextControl('info', '配置名称')->static(),
			amis()->TextControl('desc', '配置简介')->static(),
			amis()->TextControl('sort', '排序')->static(),
			amis()->TextControl('status', '是否隐藏')->static(),
		]);
	}
}