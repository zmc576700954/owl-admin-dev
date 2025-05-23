<?php

namespace App\Services;

use App\Models\SystemConfigTab;
use Slowlyo\OwlAdmin\Services\AdminService;

/**
 * 配置分类
 *
 * @method SystemConfigTab getModel()
 * @method SystemConfigTab|\Illuminate\Database\Query\Builder query()
 */
class SystemConfigTabService extends AdminService
{
	protected string $modelName = SystemConfigTab::class;
}