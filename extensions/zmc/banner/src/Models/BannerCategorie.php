<?php

namespace Zmc\Banner\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Slowlyo\OwlAdmin\Models\BaseModel as Model;

/**
 * 轮播图分类
 */
class BannerCategorie extends Model
{
	use SoftDeletes;

	protected $table = 'banner_categories';
}