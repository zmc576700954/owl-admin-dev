<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminPermissionMenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('admin_permission_menus')->insert([
            [
                'permission_id' => 1,
                'menu_id' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 2,
                'menu_id' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 3,
                'menu_id' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 2,
                'menu_id' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 4,
                'menu_id' => 4,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 2,
                'menu_id' => 4,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 5,
                'menu_id' => 5,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 2,
                'menu_id' => 5,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 6,
                'menu_id' => 6,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 2,
                'menu_id' => 6,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 7,
                'menu_id' => 7,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'permission_id' => 2,
                'menu_id' => 7,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }
}
