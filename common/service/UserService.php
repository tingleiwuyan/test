<?php
// ////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2015-2016 Hangzhou Freewind Technology Co., Ltd.
// All rights reserved.
// http://www.seastart.cn
//
// ///////////////////////////////////////////////////////////////////////////
namespace common\service;

use common\models\User;

/**
 * 商户service
 *
 * @author Ather.Shu Dec 28, 2016 11:30:39 AM
 */
class UserService {

    /**
     * 注册商户
     *
     * @param array $datas
     * @return \common\models\Supplier
     */
    public static function register($datas) {
        $user = new User();
        if( !isset( $datas ['password'] ) || strlen( $datas ['password'] ) < 6 ) {
            $user->addError( 'password', '密码长度不能小于6' );
        } else {
            $user->load( $datas, '' );
            $user->setPassword( $datas ['password'] );
            $user->generateAuthKey();
            $user->save();
        }
        return $user;
    }
}