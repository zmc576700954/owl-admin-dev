<?php

namespace Zmc\Banner\Services;

use Zmc\Banner\Models\BannerCategorie;
use Slowlyo\OwlAdmin\Services\AdminService;

/**
 * 轮播图分类
 *
 * @method BannerCategorie getModel()
 * @method BannerCategorie|\Illuminate\Database\Query\Builder query()
 */
class BannerCategorieService extends AdminService
{
	protected string $modelName = BannerCategorie::class;

    public function categoryList($where = [], $order = [])
    {
        return BannerCategorie::where($where)->get()->toArray();
    }
}
