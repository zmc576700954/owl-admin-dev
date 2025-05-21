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
        return $this->query()->where($where)->orderBy($order[0], $order[1])->get()
            ->map(fn($item) => $item->only(['id', 'name']))
            ->toArray();
    }
}
