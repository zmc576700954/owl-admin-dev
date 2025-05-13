<?php

namespace App\Admin\Controllers;

use App\Services\UserService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 用户管理
 *
 * @property UserService $service
 */
class UserController extends AdminController
{
	protected string $serviceName = UserService::class;

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
				amis()->TableColumn('name', 'Name'),
				amis()->TableColumn('email', 'Email'),
				amis()->TableColumn('email_verified_at', 'EmailVerifiedAt'),
				amis()->TableColumn('password', 'Password'),
				amis()->TableColumn('remember_token', 'RememberToken'),
				amis()->TableColumn('created_at', admin_trans('admin.created_at'))->type('datetime')->sortable(),
				amis()->TableColumn('updated_at', admin_trans('admin.updated_at'))->type('datetime')->sortable(),
				$this->rowActions('dialog')
			]);

		return $this->baseList($crud);
	}

	public function form($isEdit = false)
	{
		return $this->baseForm()->body([
			amis()->TextControl('name', 'Name'),
			amis()->TextControl('email', 'Email'),
			amis()->TextControl('email_verified_at', 'EmailVerifiedAt'),
			amis()->TextControl('password', 'Password'),
			amis()->TextControl('remember_token', 'RememberToken'),
		]);
	}

	public function detail()
	{
		return $this->baseDetail()->body([
			amis()->TextControl('id', 'ID')->static(),
			amis()->TextControl('name', 'Name')->static(),
			amis()->TextControl('email', 'Email')->static(),
			amis()->TextControl('email_verified_at', 'EmailVerifiedAt')->static(),
			amis()->TextControl('password', 'Password')->static(),
			amis()->TextControl('remember_token', 'RememberToken')->static(),
			amis()->TextControl('created_at', admin_trans('admin.created_at'))->static(),
			amis()->TextControl('updated_at', admin_trans('admin.updated_at'))->static(),
		]);
	}
}