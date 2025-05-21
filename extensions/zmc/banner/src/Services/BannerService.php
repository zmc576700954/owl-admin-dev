<?php

namespace Zmc\Banner\Services;

use Zmc\Banner\Models\Banner;
use Slowlyo\OwlAdmin\Services\AdminService;

/**
 * 轮播图设置
 *
 * @method Banner getModel()
 * @method Banner|\Illuminate\Database\Query\Builder query()
 */
class BannerService extends AdminService
{
	protected string $modelName = Banner::class;

}
