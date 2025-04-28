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
        Schema::create('admin_apis', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->comment('接口名称');
            $table->string('path')->comment('接口路径');
            $table->string('template')->comment('接口模板');
            $table->tinyInteger('enabled')->default(1)->comment('是否启用');
            $table->longText('args')->nullable()->comment('接口参数');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admin_apis');
    }
};
