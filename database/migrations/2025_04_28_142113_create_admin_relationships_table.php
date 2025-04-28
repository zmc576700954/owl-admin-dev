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
        Schema::create('admin_relationships', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('model')->comment('模型');
            $table->string('title')->comment('关联名称');
            $table->string('type')->comment('关联类型');
            $table->string('remark')->nullable()->comment('关联名称');
            $table->text('args')->nullable()->comment('关联参数');
            $table->text('extra')->nullable()->comment('额外参数');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admin_relationships');
    }
};
