<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminExtensionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('admin_extensions')->insert([
            [
                'name' => 'slowlyo.owl-dict',
                'is_enabled' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'slowlyo.owl-login-guard',
                'is_enabled' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'slowlyo.owl-log-viewer',
                'is_enabled' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'slowlyo.owl-amis-json-parse',
                'is_enabled' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'slowlyo.owl-menu-search',
                'is_enabled' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }
}
