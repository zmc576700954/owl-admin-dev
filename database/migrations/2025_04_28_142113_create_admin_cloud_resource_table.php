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
        Schema::create('admin_cloud_resource', function (Blueprint $table) {
            $table->comment('云资源表');
            $table->char('id', 26)->primary();
            $table->string('title')->default('')->comment('名称');
            $table->unsignedBigInteger('size')->default(0)->comment('大小（字节）');
            $table->text('url')->nullable()->comment('资料URL');
            $table->string('extension', 100)->default('')->comment('扩展名');
            $table->unsignedTinyInteger('is_type')->default(0)->index()->comment('类型（1：图片；2：文档；3：视频；4：音频；5：其他；）');
            $table->unsignedInteger('storage_id')->default(0)->index()->comment('存储ID');
            $table->unsignedBigInteger('created_user')->default(0)->comment('创建人');
            $table->unsignedBigInteger('deleted_user')->default(0)->comment('删除人');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admin_cloud_resource');
    }
};
