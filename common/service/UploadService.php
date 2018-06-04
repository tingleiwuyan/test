<?php
// ////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2015-2016 Hangzhou Freewind Technology Co., Ltd.
// All rights reserved.
// http://www.seastart.cn
//
// ///////////////////////////////////////////////////////////////////////////
namespace common\service;
use common\util\AliBcManager;
use common\util\Constants;
use yii\web\UnauthorizedHttpException;
/**
 * 
 * @author Ather.Shu Feb 27, 2017 9:35:11 AM
 */
class UploadService {
    public static function getWantuToken() {
        return AliBcManager::getWantuUploadToken();
    }
    
    public static function getWantuUploadName($type, $extension='jpg') {
        $types = [
            Constants::UPLOAD_TYPE_TEST_IMG,
            Constants::UPLOAD_TYPE_CKEDITOR,
            Constants::UPLOAD_TYPE_USER_AVATAR,
            Constants::UPLOAD_TYPE_CATEGORY_PHOTO,
            Constants::UPLOAD_TYPE_GOODS_IMG,
            Constants::UPLOAD_EXCEL,
        ];
        if( !in_array( $type, $types ) ) {
            throw new UnauthorizedHttpException( '上传用途不明' );
        }
        $now = time() . mt_rand(1, 10000);
        $filename = "{$now}.{$extension}";
        $dir = $type;
        
        /*if($type == Constants::UPLOAD_TYPE_REQUIREMENT_BANNER){
            $dir = "/res/upload/11/";
            $filename = "requirement_banner.png";
        }
        else if($type == Constants::UPLOAD_TYPE_COMPANY_VERIFY_DOCUMENT_DOC){
            $dir = "/res/upload/13/";
            $filename = "cverify.doc";
        }
        else if($type == Constants::UPLOAD_TYPE_COMPANY_VERIFY_DOCUMENT){
            $dir = "/res/upload/8/";
            $filename = "cverify.png";
        }*/
        return [
            'dir' => $type,
            'name' => $filename
        ];
    }
}