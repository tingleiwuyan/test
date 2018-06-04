<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Commodity */

$this->title = 'Update Commodity: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Commodities', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->Id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="commodity-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
