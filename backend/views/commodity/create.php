<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Commodity */

$this->title = 'Create Commodity';
$this->params['breadcrumbs'][] = ['label' => 'Commodities', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="commodity-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
