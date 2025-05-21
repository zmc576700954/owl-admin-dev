<?php

use Zmc\Banner\Http\Controllers;
use Illuminate\Support\Facades\Route;

Route::get('/banner_categories/bannerCategory', [Controllers\BannerCategorieController::class, 'bannerCategory']);
Route::resource('banner_categories', Controllers\BannerCategorieController::class);
Route::resource('banners', Controllers\BannerController::class);
