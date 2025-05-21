<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('banner_categories', function (Blueprint $table) {
            $table->id();
            $table->string('name', 100)->comment('分类名称');
            $table->integer('sort')->comment('排序')->default(0);
            $table->timestamps();
            $table->softDeletes();
            $table->comment('轮播图分类');
        });
        Schema::create('banners', function (Blueprint $table) {
            $table->id();
            $table->foreignId('category_id')->comment('分类ID')->constrained('banner_categories', 'id');
            $table->string('title', 150)->comment('标题');
            $table->string('url', 255)->comment('连接');
            $table->integer('sort')->comment('排序')->default(0);
            $table->timestamps();
            $table->softDeletes();
            $table->comment('轮播图');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('banner_categories');
        Schema::dropIfExists('banners');
    }
};
