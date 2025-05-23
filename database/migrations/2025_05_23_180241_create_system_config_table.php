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
        Schema::create('system_config', function (Blueprint $table) {
            $table->comment('配置项');
            $table->increments('id');
            $table->tinyInteger('is_store')->default(new \Illuminate\Database\Query\Expression('0'))->comment('0=总后台,1=门店');
            $table->string('menu_name')->default('')->comment('字段名称');
            $table->string('type')->default('')->comment('类型(文本框,单选按钮...)');
            $table->string('input_type')->default('input')->comment('表单类型');
            $table->integer('config_tab_id')->default(new \Illuminate\Database\Query\Expression('0'))->comment('配置分类id');
            $table->string('parameter')->default('')->comment('规则 单选框和多选框');
            $table->tinyInteger('upload_type')->default(new \Illuminate\Database\Query\Expression('1'))->comment('上传文件格式1单图2多图3文件');
            $table->string('required')->default('')->comment('规则');
            $table->integer('width')->default(new \Illuminate\Database\Query\Expression('0'))->comment('多行文本框的宽度');
            $table->integer('high')->default(new \Illuminate\Database\Query\Expression('0'))->comment('多行文框的高度');
            $table->string('value')->default('')->comment('默认值');
            $table->string('info')->default('')->comment('配置名称');
            $table->string('desc')->default('')->comment('配置简介');
            $table->integer('sort')->default(new \Illuminate\Database\Query\Expression('0'))->comment('排序');
            $table->tinyInteger('status')->default(new \Illuminate\Database\Query\Expression('0'))->comment('是否隐藏');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('system_config');
    }
};
