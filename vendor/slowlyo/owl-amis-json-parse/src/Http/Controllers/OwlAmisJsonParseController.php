<?php

namespace Slowlyo\OwlAmisJsonParse\Http\Controllers;

use Illuminate\Http\Request;
use Slowlyo\OwlAdmin\Renderers\Card;
use Slowlyo\OwlAdmin\Renderers\Form;
use Slowlyo\OwlAdmin\Renderers\Flex;
use Slowlyo\OwlAdmin\Renderers\Html;
use Slowlyo\OwlAdmin\Renderers\UrlAction;
use Slowlyo\OwlAmisJsonParse\Support\Parse;
use Slowlyo\OwlAdmin\Renderers\EditorControl;
use Slowlyo\OwlAdmin\Renderers\VanillaAction;
use Slowlyo\OwlAdmin\Renderers\SwitchControl;
use Slowlyo\OwlAdmin\Controllers\AdminController;

class OwlAmisJsonParseController extends AdminController
{
    public function index()
    {
        $page = $this->basePage()->body([
            Card::make()->body(
                Form::make()->id('parse_form')->api(admin_url('/slow-amis-json-parse'))->wrapWithPanel(false)->body([
                    Flex::make()->className('pb-4')->justify('end')->items([
                        UrlAction::make()
                            ->className('mr-5')
                            ->label('amis 可视化编辑器')
                            ->url('https://aisuda.github.io/amis-editor-demo/#/edit/0')
                            ->blank(true),
                        Html::make()->html('&emsp;'),
                        VanillaAction::make()->label('解析')->type('submit')->level('primary')->actionType('ajax'),
                    ]),
                    SwitchControl::make()->name('extract_namespace')->label('提取 namespace')->value(false)->onEvent([
                        'change' => [
                            'actions' => [
                                [
                                    'actionType'  => 'setValue',
                                    'componentId' => 'parse_form',
                                    'args'        => ['value' => ['use_make_func' => false,],],
                                ],
                            ],
                        ],
                    ]),
                    SwitchControl::make()->name('use_make_func')->label('使用 amisMake 方法')->value(false)->onEvent([
                        'change' => [
                            'actions' => [
                                [
                                    'actionType'  => 'setValue',
                                    'componentId' => 'parse_form',
                                    'args'        => ['value' => ['extract_namespace' => false,],],
                                ],
                            ],
                        ],
                    ]),
                    EditorControl::make()
                        ->name('json')
                        ->label('amis json schema')
                        ->language('json')
                        ->allowFullscreen(false)
                        ->required(true),
                    EditorControl::make()->name('php')->label('php')->language('php')->allowFullscreen(false),
                    EditorControl::make()
                        ->name('namespace')
                        ->label('namespace')
                        ->language('php')
                        ->visibleOn('${namespace}')
                        ->allowFullscreen(false),
                ])
            ),
        ]);

        return $this->response()->success($page);
    }

    public function parse(Request $request)
    {
        $json = $request->input('json');

        if (!$this->isJson($json)) {
            return $this->response()->fail('无法解析，请检查 json 格式是否正确');
        }

        $parse     = Parse::make($request->input('extract_namespace'), $request->input('use_make_func'));
        $php       = $parse->transform(json_decode($json, true));
        $namespace = $parse->getNamespaces();

        return $this->response()->success(compact('php', 'namespace'));
    }

    public function isJson($string)
    {
        json_decode($string);
        return (json_last_error() == JSON_ERROR_NONE);
    }
}
