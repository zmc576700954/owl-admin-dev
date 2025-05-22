<?php

namespace Zmc\Banner\Services;

use Illuminate\Support\Collection;
use LaravelIdea\Helper\Slowlyo\OwlAdmin\Models\_IH_BaseModel_C;
use Slowlyo\OwlAdmin\Models\BaseModel;
use Zmc\Banner\Models\Banner;
use Slowlyo\OwlAdmin\Services\AdminService;
use Zmc\Banner\Models\BannerCategorie;
use Illuminate\Database\Eloquent\Builder;

/**
 * 轮播图设置
 *
 * @method Banner getModel()
 * @method Banner|\Illuminate\Database\Query\Builder query()
 */
class BannerService extends AdminService
{
	protected string $modelName = Banner::class;

    /**
     * 根据分类名称获取轮播图
     * @param $name
     * @return array|mixed
     */
    public function getCategoryBannerList($name)
    {
        return $this->query()->whereHas('banner_categories', function (Builder $query) use ($name) {
            $query->where('name', $name);
        })->get()->toArray();
    }

    /**
     * 获取列表
     * @param $where
     * @param $order
     * @param $relation
     * @return Collection|_IH_BaseModel_C|BaseModel[]
     */
    public function getList($where, $order = ['id', 'DESC'], $relation = '')
    {
        $list = $this->query();
        if (!empty($relation)) {
            $list = $list::with($relation);
        }
        $list = $list->where($where);
        if (!empty($order[0]) && !empty($order[1])) {
            $list = $list->orderBy($order[0], $order[1]);
        }
        return $list->get();
    }
}
