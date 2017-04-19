<?php
// ////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2015-2016 Hangzhou Freewind Technology Co., Ltd.
// All rights reserved.
// http://www.seastart.cn
//
// ///////////////////////////////////////////////////////////////////////////
namespace common\service;

use common\models\Supplier;
use common\util\Constants;

/**
 * 商户service
 *
 * @author Ather.Shu Dec 28, 2016 11:30:39 AM
 */
class SupplierService {

    /**
     * 注册商户
     *
     * @param array $datas
     * @return \common\models\Supplier
     */
    public static function register($datas) {
        $supplier = new Supplier();
        if( !isset( $datas ['password'] ) || strlen( $datas ['password'] ) < 6 ) {
            $supplier->addError( 'password', '密码长度不能小于6' );
        } else {
            $supplier->load( $datas, '' );
            $supplier->setPassword( $datas ['password'] );
            $supplier->generateAuthKey();
            $supplier->save();
        }
        return $supplier;
    }
    public static function Disapprove($id)
    {
        $model = Supplier::find()->where(['id'=>$id])->one();
        $model->status = Constants::PLAN_STATUS_F;
        $model->admin_uid=\Yii::$app->user->id;
        if($model->save()){
            return true;
        }
        return false;
    }

    public static function Approve($id)
    {
        $model = Supplier::find()->where(['id'=>$id])->one();
        $model->status = Constants::PLAN_STATUS_P;
        $model->admin_uid=\Yii::$app->user->id;
        if($model->save()){
            return true;
        }
        return false;
    }
}