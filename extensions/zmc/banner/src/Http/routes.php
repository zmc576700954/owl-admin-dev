<?php

use Zmc\Banner\Http\Controllers;
use Illuminate\Support\Facades\Route;

Route::get('/banner_categories/categoryList', [\Zmc\Banner\Http\Controllers\BannerCategorieController::class, 'categoryList']);
Route::resource('banner_categories', \Zmc\Banner\Http\Controllers\BannerCategorieController::class);
Route::resource('banners', \Zmc\Banner\Http\Controllers\BannerController::class);
