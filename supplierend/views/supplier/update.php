<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Supplier */

$this->title = '修改设计师: ' . $model->username;
$this->params['breadcrumbs'][] = ['label' => '修改设计师', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->username, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = '修改';
?>
<div class="supplier-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
