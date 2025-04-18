<?php

namespace Slowlyo\Support\Traits;

/**
 * 增加 LOAD DATA 语句的支持
 *
 * 使用:
 *      1. config/database.php 中增加配置 connections.mysql.options => PDO::MYSQL_ATTR_LOCAL_INFILE => true
 *      2. 在需要使用的 Model 中 use MysqlLoadDataTrait
 *
 * @mixin \Illuminate\Database\Eloquent\Model
 */
trait MysqlLoadDataTrait
{
    /**
     * @param \Iterator $data  需要写入的数据
     *                         - 每一项为分块后的数组 (避免内存溢出, 可传入 Generator)
     *                         - [
     *                         -    [
     *                         -        ['id' => null, 'name' => 'a', ...],
     *                         -        ['id' => null, 'name' => 'b', ...]
     *                         -    ],
     *                         -    ...
     *                         - ]
     *                         - 需要完整的对应每一个字段, 可为 null
     *
     * @return void
     * @throws \Exception
     */
    public static function loadData(\Iterator $data)
    {
        // 创建临时文件
        $tempFile = tempnam(sys_get_temp_dir(), 'mysql_load_data_');
        if (!$tempFile) {
            throw new \Exception('Write temp file failed');
        }

        // 分块把数据写入文件
        foreach ($data as $chunk) {
            $content = '';
            foreach ($chunk as $item) {
                $content .= implode(',', $item) . "\n";
            }
            file_put_contents($tempFile, $content, FILE_APPEND);
        }

        // 执行 LOAD DATA 语句
        $model = app(static::class);
        $table = $model->getTable();
        $query = "LOAD DATA LOCAL INFILE '{$tempFile}' INTO TABLE {$table} FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'";
        $pdo   = $model->getConnection()->getPdo();
        $pdo->setAttribute(\PDO::ATTR_EMULATE_PREPARES, true);
        $statement = $pdo->prepare($query, [\PDO::ATTR_CURSOR => \PDO::CURSOR_SCROLL]);

        $exec = $statement->execute();

        if (!$exec) {
            @unlink($tempFile);
            throw new \Exception($pdo->errorInfo());
        }

        // 删除临时文件
        @unlink($tempFile);
    }
}
