<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('admin_permissions')->insert([
            [
                'parent_id' => 0,
                'custom_order' => 0,
                'name' => '首页',
                'slug' => 'home',
                'http_path' => "['/home*']",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'parent_id' => 0,
                'custom_order' => 0,
                'name' => '系统',
                'slug' => 'system',
                'http_path' => "['/home*']",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'parent_id' => 2,
                'custom_order' => 0,
                'name' => '管理员',
                'slug' => 'admin_users',
                'http_path' => "['/admin_users*']",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'parent_id' => 2,
                'custom_order' => 0,
                'name' => '角色',
                'slug' => 'roles',
                'http_path' => "['/roles*']",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'parent_id' => 2,
                'custom_order' => 0,
                'name' => '权限',
                'slug' => 'permissions',
                'http_path' => "['/permissions*']",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'parent_id' => 2,
                'custom_order' => 0,
                'name' => '菜单',
                'slug' => 'menus',
                'http_path' => "['/menus*']",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'parent_id' => 2,
                'custom_order' => 0,
                'name' => '设置',
                'slug' => 'settings',
                'http_path' => "['/settings*']",
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }
}
