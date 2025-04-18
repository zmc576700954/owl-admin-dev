<?php

use Slowlyo\OwlAmisJsonParse\Http\Controllers;
use Illuminate\Support\Facades\Route;

Route::get('slow-amis-json-parse', [Controllers\OwlAmisJsonParseController::class, 'index']);
Route::post('slow-amis-json-parse', [Controllers\OwlAmisJsonParseController::class, 'parse']);
