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

        <?= Html::a(Yii::t('app', '更新'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', '删除'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
            <a href="/admin/assignment/view?id=<?php echo $model->id;?>" class="btn btn-primary">分配权限</a>
    </p>

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
