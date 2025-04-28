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
        Schema::create('admin_permissions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', 50)->unique();
            $table->string('slug', 50)->unique();
            $table->text('http_method')->nullable();
            $table->text('http_path')->nullable();
            $table->integer('custom_order')->default(0);
            $table->integer('parent_id')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admin_permissions');
    }
};
