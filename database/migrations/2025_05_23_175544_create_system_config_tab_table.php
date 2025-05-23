<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('system_config_tab', function (Blueprint $table) {
            $table->comment('配置分类');
            $table->increments('id');
            $table->tinyInteger('is_store')->default(new \Illuminate\Database\Query\Expression('0'))->comment('0=总后台,1=门店');
            $table->integer('pid')->default(new \Illuminate\Database\Query\Expression('0'))->comment('上级分类id');
            $table->string('title')->default('')->comment('配置分类名称');
            $table->string('eng_title')->default('')->comment('配置分类英文名称');
            $table->tinyInteger('status')->default(new \Illuminate\Database\Query\Expression('1'))->comment('配置分类状态');
            $table->tinyInteger('info')->default(new \Illuminate\Database\Query\Expression('0'))->comment('配置分类是否显示');
            $table->string('icon')->default('')->comment('图标');
            $table->integer('type')->default(new \Illuminate\Database\Query\Expression('0'))->comment('配置类型');
            $table->integer('sort')->default(new \Illuminate\Database\Query\Expression('0'))->comment('排序');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('system_config_tab');
    }
};
