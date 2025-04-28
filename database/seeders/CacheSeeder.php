<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CacheSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('admin_role_permissions')->insert([
            [
                'key' => "admin_extensions",
                'value' => 'O:39:"Illuminate\Database\Eloquent\Collection":2:{s:8:"',
                'expiration' => 2060323823,
            ],
            [
                'key' => "admin_has_table_admin_extensions",
                'value' => 'b:1;',
                'expiration' => 2060308506,
            ],
            [
                'key' => "admin_has_table_admin_relationships",
                'value' => 'b:1;',
                'expiration' => 2060306212,
            ],
            [
                'key' => "admin_relationships",
                'value' => 'O:39:"Illuminate\Database\Eloquent\Collection":2:{s:8:"',
                'expiration' => 2060306212,
            ],
            [
                'key' => "app_setting_admin_locale",
                'value' => 's:5:"zh_CN";',
                'expiration' => 2060306212,
            ],
            [
                'key' => "app_setting_hyperf-plus:ai-helper",
                'value' => 'N;',
                'expiration' => 2060323140,
            ],
            [
                'key' => "app_setting_likeweb:core",
                'value' => 'N;',
                'expiration' => 2060323629,
            ],
            [
                'key' => "app_setting_slowlyo:owl-dict",
                'value' => 'N;',
                'expiration' => 2060323604,
            ],
            [
                'key' => "app_setting_slowlyo:owl-icon-cache",
                'value' => 'N;',
                'expiration' => 2060327192,
            ],
            [
                'key' => "app_setting_slowlyo:owl-wechat-user",
                'value' => 'N;',
                'expiration' => 2060323823,
            ],
            [
                'key' => "app_setting_system_theme_setting",
                'value' => 'a:16:{s:9:"darkTheme";b:0;s:6:"footer";b:0;s:10:"breadcrumb";b:1;s:10:"themeColor";s:15:"rgb(146,99,239)";s:10:"layoutMode";s:7:"default";s:10:"siderTheme";s:5:"light";s:8:"topTheme";s:5:"light";s:13:"animateInType";s:5:"alpha";s:17:"animateInDuration";i:600;s:14:"animateOutType";s:5:"alpha";s:18:"animateOutDuration";i:600;s:13:"loginTemplate";s:4:"amis";s:9:"keepAlive";b:0;s:9:"enableTab";b:1;s:7:"tabIcon";b:1;s:13:"accordionMenu";b:0;}',
                'expiration' => 2060327187,
            ],
            [
                'key' => "cache_cloud_storage",
                'value' => 's:173:"{"id":null,"title":"\u672c\u5730\u5b58\u50a8","driver":"local","config":{"domain":"http:\/\/owl-local.com\/","root":"uploads"},"file_size":3,"accept":null,"is_default":true}";',
                'expiration' => 2060323570,
            ]
        ]);
    }
}
