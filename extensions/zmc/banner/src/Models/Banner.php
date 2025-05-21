<?php

namespace Zmc\Banner\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Slowlyo\OwlAdmin\Models\BaseModel as Model;

/**
 * 轮播图设置
 */
class Banner extends Model
{
	use SoftDeletes;

    public function banner_categories()
    {
        return $this->belongsTo(BannerCategorie::class, 'category_id', 'id');
    }
}
