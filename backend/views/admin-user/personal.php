<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\AdminUser */

$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', '管理员'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="admin-user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>

        <?= Html::a(Yii::t('app', '更新'), ['uppersonal'], ['class' => 'btn btn-primary']) ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            // 'id',
            'username',
//             'password_hash',
            'nickname',
//             'password_reset_token',
//             'auth_key',
//             'status',
            'position',
            'contact',
            [
                'attribute' => 'status',
                'value' => $model->status ? '激活' : '禁止',
            ],
//             'group',
//             'created_at',
//             'updated_at',
        ],
    ]) ?>

</div>
