<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Supplier */

$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => '供应商', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('修改', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            'nickname',
            [
                'attribute'=>'created_at',
                'value'=>date('Y-m-d H:i:s',$model->created_at),
            ],
            [
                'attribute'=>'updated_at',
                'value'=>date('Y-m-d H:i:s',$model->updated_at),
            ],
            ['attribute' => 'status', 'value'=>\common\util\Constants::$STATUS[$model->status]],
            [
                'attribute'=>'admin_uid',
                'value'=>$model->admin_uid?$model->adminU->nickname:"无",
            ],
        ],
    ]) ?>

</div>
