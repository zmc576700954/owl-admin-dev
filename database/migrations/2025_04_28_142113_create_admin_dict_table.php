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
        Schema::create('admin_dict', function (Blueprint $table) {
            $table->comment('数据字典');
            $table->bigIncrements('id');
            $table->string('parent_id')->default('0')->index()->comment('父级ID');
            $table->string('key')->index()->comment('编码');
            $table->tinyInteger('enabled')->default(1)->index()->comment('是否启用');
            $table->integer('sort')->default(0)->index()->comment('排序');
            $table->text('value')->comment('名称');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admin_dict');
    }
};
