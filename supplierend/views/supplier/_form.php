<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Supplier */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="supplier-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nickname')->textInput(['maxlength' => true]) ?>

    <?php if($model->isNewRecord) {
        echo  $form->field($model, 'password')->passwordInput(['maxlength' => true]);
    } else {
        echo $form->field($model, 'password', ['template' => "{label} <a id='reset_pwd'>修改密码</a>\n{input}\n{hint}\n{error}"])->passwordInput(['id' => 'pwd', 'maxlength' => true, 'disabled' => true]);
    }?>



    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '新建' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
