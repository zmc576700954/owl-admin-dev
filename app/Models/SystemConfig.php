<?php

namespace App\Models;

use Slowlyo\OwlAdmin\Models\BaseModel as Model;

/**
 * 配置项
 */
class SystemConfig extends Model
{

	protected $table = 'system_config';

	public $timestamps = false;
}