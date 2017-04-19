<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\SupplierSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '供应商管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新增供应商', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            ['attribute'=>'username',
                'contentOptions'=>['width'=>'100px'],
            ],

            ['attribute'=>'nickname',
                'contentOptions'=>['width'=>'100px'],
            ],
            ['attribute'=>'created_at',
                'format'=>['date','php:Y-m-d H:i:s'],
            ],
            ['attribute'=>'updated_at',
                'format'=>['date','php:Y-m-d H:i:s'],
            ],
            ['attribute'=>'status',
                'value'=>function($model)
                {
                    return \common\util\Constants::$STATUS[$model->status];
                },
                'filter'=>\common\util\Constants::$STATUS,
            ],
            ['attribute'=>'adminuname',
                'label'=>'审核者',
                'value'=>'adminU.nickname',
                'filter'=>\backend\models\AdminUser::find()
                    ->select(['nickname'])
                    ->indexBy('nickname')
                    ->column(),
            ],
            ['class' => 'yii\grid\ActionColumn','template'=>"{view}{delete}{approve}{disapprove}",
            'buttons'=>[
                    'approve'=>function($url,$model,$key){
                        $options=[
                                'title'=>Yii::t('yii','审核通过'),
                                'aria-label'=>Yii::t('yii','审核通过'),
                                'data-confirm'=>Yii::t('yii','确认审核通过吗？'),
                                'data-method'=>'Post',
                                'data-pjax'=>'0',
                        ];
                        return Html::a('&nbsp;<span class="glyphicon glyphicon-upload"></span>',$url,$options);
                    },
                    'disapprove'=>function($url,$model,$key){
                        $options=[
                            'title'=>Yii::t('yii','审核失败'),
                            'aria-label'=>Yii::t('yii','审核失败'),
                            'data-confirm'=>Yii::t('yii','确认审核失败吗？'),
                            'data-method'=>'Post',
                            'data-pjax'=>'0',
                        ];
                        return Html::a('&nbsp;<span class="glyphicon glyphicon-download"></span>',$url,$options);
                    }

    ]
            ],

        ],
    ]); ?>
</div>
