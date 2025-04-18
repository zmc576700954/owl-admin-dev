<?php

namespace Slowlyo\OwlAdmin\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\JsonResource;

trait ExportTrait
{
    /**
     * 导出
     *
     * @return JsonResponse|JsonResource
     */
    protected function export()
    {
        admin_abort_if(!class_exists('\Rap2hpoutre\FastExcel\FastExcel'), admin_trans('admin.export.please_install_laravel_excel'));

        // 处理可能存在的对象参数
        request()->replace(array_map(fn($i) => is_json($i) ? json_decode($i, true) : $i, request()->all()));

        // 默认在 storage/app/ 下
        $path = sprintf('%s-%s.xlsx', $this->exportFileName(), date('YmdHis'));

        // 导出本页和导出选中项都是通过 _ids 查询
        $ids = request()->input('_ids');

        // listQuery() 为列表查询条件，与获取列表数据一致
        $query = $this->service
            ->listQuery()
            ->when($ids, function ($query) use ($ids) {
                return $query->whereIn(
                    $this->service->getModel()->getTable() . '.' . $this->service->primaryKey(),
                    explode(',', $ids)
                );
            });

        try {
            fastexcel($query->get())->export(storage_path('app/' . $path), fn($row) => $this->exportMap($row));
        } catch (\Throwable $e) {
            report($e);

            admin_abort(admin_trans('admin.action_failed'));
        }

        return $this->response()->success(compact('path'));
    }

    /**
     * @param $row
     *
     * @return mixed
     */
    protected function exportMap($row)
    {
        return $row;
    }

    /**
     * 导出文件名
     *
     * @return string
     */
    protected function exportFileName()
    {
        return strtolower(str_replace('Controller', '', class_basename($this)));
    }
}
