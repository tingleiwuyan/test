<?php
// ////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2015-2016 Hangzhou Freewind Technology Co., Ltd.
// All rights reserved.
// http://www.seastart.cn
//
// ///////////////////////////////////////////////////////////////////////////
namespace common\models;

use common\service\UploadService;
use common\util\Constants;
use yii\base\Model;
use yii\validators\FileValidator;
use yii\validators\ImageValidator;
use yii\web\UploadedFile;
use common\util\AliBcManager;

/**
 * 文件上传
 *
 * @author Ather.Shu Dec 15, 2014 3:48:20 PM
 */
class FileUploadForm extends Model {

    public $type;

    /**
     * 上传的文件
     *
     * @var UploadedFile
     */
    public $file;

    private static $_useWantu = true;

    public function rules() {
        return [ 
            [ 
                [ 
                    'type',
                    'file' 
                ],
                'required' 
            ],
            [ 
                'type',
                'integer' 
            ],
            [ 
                'file',
                'validateFile' 
            ] 
        ];
    }

    public function validateFile() {
        if( array_key_exists($this->type, Constants::$UPLOAD_TYPES) ) {
            $file=explode('.', $this->file);
            $suffix=end($file);
            if($suffix=='xls'||$suffix=='xlsx')
            {
                $validator = new FileValidator();
                $validator->extensions = isset(Constants::$UPLOAD_TYPES[$this->type]['extensions']) ? Constants::$UPLOAD_TYPES[$this->type]['extensions'] : [
                    'doc',
                    'xls',
                    'xlsx'
                ];
                $validator->checkExtensionByMimeType = false;
                // 700k
                $validator->maxSize = Constants::$UPLOAD_TYPES[$this->type]['max'] * 1024 * 1024;
                $validator->validateAttribute($this, 'file');
            }
            else{
                $validator = new ImageValidator();
                $validator->extensions = isset(Constants::$UPLOAD_TYPES[$this->type]['extensions']) ? Constants::$UPLOAD_TYPES[$this->type]['extensions'] : [
                    'jpg',
                    'jpeg',
                    'png',
                    'gif'
                ];
                $validator->mimeTypes = [
                    'image/jpeg',
                    'image/png',
                    'image/gif'
                ];
                // 700k
                $validator->maxSize = Constants::$UPLOAD_TYPES[$this->type]['max'] * 1024 * 1024;
                $validator->validateAttribute( $this, 'file' );
            }
        } else {
            $this->addError( 'type', '上传用途不明' );
        }
    }

    public function save() {
        if( $this->validate() ) {
            $path = $this->innerSave();
            return $path;
        }
        return false;
    }

    /**
     * 删除已经上传的图片
     *
     * @param string $path 如/res/upload/2/xy/10009.png
     */
    public static function deleteUploadedFile($path) {
        if( self::$_useWantu ) {
            // "/1/xx.jpg"
            $tmp = explode( "/", $path );
            AliBcManager::deleteWantuFile( $tmp [1], $tmp [2] );
        } else {
            @unlink( \Yii::getAlias( '@frontend' ) . "/web{$path}" );
        }
    }

    private function innerSave() {

        /*$now = time() . mt_rand( 1, 10000 );
        // 如果使用阿里云顽兔存储，传到云端
        if( self::$_useWantu ) {
            return AliBcManager::uploadToWantu( $this->file->tempName, $this->type, "{$now}.{$this->file->extension}" );
        }
        $rand = substr( md5( $now ), 2, 2 );
        $path = "/res/upload/{$this->type}/{$rand}";
        $dir = \Yii::getAlias( '@frontend' ) . "/web{$path}";
        if( !file_exists( $dir ) ) {
            @mkdir( $dir, 0777, true );
        }
        $this->file->saveAs( "{$dir}/{$now}.{$this->file->extension}" );
        return $path . "/{$now}.{$this->file->extension}";*/
        if($this->type==Constants::UPLOAD_EXCEL){
            $now = time() . mt_rand( 1, 10000 );
            $rand = substr( md5( $now ), 2, 2 );
            $path = "/res/upload/{$this->type}/{$rand}";
            $dir = \Yii::getAlias( '@frontend' ) . "/web{$path}";
            if( !file_exists( $dir ) ) {
                @mkdir( $dir, 0777, true );
            }
            $this->file->saveAs( "{$dir}/{$now}.{$this->file->extension}" );
            return $path . "/{$now}.{$this->file->extension}";
        }
        $info = UploadService::getWantuUploadName($this->type, $this->file->extension);
        if( self::$_useWantu ) {

            return AliBcManager::uploadToWantu( $this->file->tempName, $info['dir'], $info['name']);
        }
    }

}