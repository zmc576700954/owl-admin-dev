<?php

namespace App\Services;

use App\Models\SystemConfig;
use Slowlyo\OwlAdmin\Services\AdminService;

/**
 * 配置项
 *
 * @method SystemConfig getModel()
 * @method SystemConfig|\Illuminate\Database\Query\Builder query()
 */
class SystemConfigService extends AdminService
{
	protected string $modelName = SystemConfig::class;
}