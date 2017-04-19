<?php
// ////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2015-2016 Hangzhou Freewind Technology Co., Ltd.
// All rights reserved.
// http://www.seastart.cn
//
// ///////////////////////////////////////////////////////////////////////////
namespace common\util;


/**
 * 常量
 *
 * @author Ather.Shu Apr 27, 2015 10:55:22 AM
 */
class Constants {
    // http请求头
    const APP_JOKE = 'whatafuckdamage!';
    // access token有效期（多久不调接口） 10天
    const ACCESS_TOKEN_EXPIRES = 864000;
    // 内部调用api的device标示
    const DEVICE_INNER_CALL = "inner_api_call";
    // id加密
    const ID_CRYPT_KEY = "y11twoa99_k3y_";
    // id加密类型：用户
    const ENC_TYPE_USER = "user";
    
    // api data加密
    const DATA_ENCRYPT_IV = "y11twoa99_iv_";
    // img分割符
    const IMG_DELIMITER = "||";
    // 上传类型
    const UPLOAD_TYPE_TEST_IMG = 1;
    const UPLOAD_TYPE_CKEDITOR = 2;
    const UPLOAD_TYPE_CONTRACT = 3;
    
    public static $UPLOAD_TYPES = [
        self::UPLOAD_TYPE_TEST_IMG => [
            'name' => '测试',
            'max' => 0.7
        ],
        self::UPLOAD_TYPE_CKEDITOR => [
            'name' => '后台编辑器',
            'max' => 1
        ],
        self::UPLOAD_TYPE_CONTRACT => [
            'name' => '合同',
            'max' => 10,
            'extensions'=>['doc','jpg',
                'xls','xlsx',
                'jpeg',
                'png',
                'gif'],
        ],
//         self::UPLOAD_TYPE_MALL_GOODS_ANIMATION => [
//             'name' => '动画',
//             'max' => 10,
//             'extensions' => ['zip'],
//         ],
    ];

    // 区分充值、订单支付的标志
    const CHARGE_EXTRA_FLAG = '000';
    
    // 支付类型
    const PAY_TYPE_WX = 1;
    const PAY_TYPE_ZFB = 2;
    const PAY_TYPE_LL = 3;

    public static $PAY_TYPES = [ 
        self::PAY_TYPE_WX => "wx",
        self::PAY_TYPE_ZFB => "zfb" ,
        self::PAY_TYPE_LL => "ll"
    ];
    
    // 平台类型
    const PLATFORM_WEB = 1;
    const PLATFORM_IOS = 2;
    const PLATFORM_ANDROID = 3;

    public static $PLATFORMS = [ 
        self::PLATFORM_WEB => "web",
        self::PLATFORM_IOS => "ios",
        self::PLATFORM_ANDROID => "android" 
    ];
    
    //OAUTH类型
    const OAUTH_MOBILE = 1;
    const OAUTH_WEIBO = 2;
    const OAUTH_QQ = 3;
    const OAUTH_WEIXIN_APP = 4;
    const OAUTH_WEIXIN_GZH = 5;
    
    public static $OAUTHS = [
        self::OAUTH_MOBILE => '手机',
        self::OAUTH_WEIBO => '微博',
        self::OAUTH_QQ => 'QQ',
        self::OAUTH_WEIXIN_APP => '微信APP',
        self::OAUTH_WEIXIN_GZH => '微信公众号',
    ];
    
    // 缓存类型
    //用户手机验证码
    const CACHE_USER_MOBILE_CODE = 1;
    //平台屏蔽关键词
    const CACHE_SYSTEM_BANWORDS = 2;
    
    //性别男女
    const GENDER_FEMALE = 0;
    const GENDER_MALE = 1;

    public static $GENDER = [
        self::GENDER_MALE => '女',
        self::GENDER_FEMALE  => '男',
    ];
    //默认头像
    const DEFAULT_AVATAR = "/img/avatar.png";
    
    const DEV_PROGRESS_START = 0;
    const DEV_PROGRESS_MIDDLE = 1;
    const DEV_PROGRESS_MATURE = 2;
    
    public static $DEV_PROGRESSES = [
        self::DEV_PROGRESS_START => '初创期',
        self::DEV_PROGRESS_MIDDLE => '发展期',
        self::DEV_PROGRESS_MATURE => '成熟期',
    ];

    const ROLE_MANAGER = 0;
    const ROLE_DIRECTOR = 1;
    public static $ROLE = [
        self::ROLE_MANAGER => '项目经理',
        self::ROLE_DIRECTOR => '总监',
    ];

    const PROJECT_STATUS_UNSIGN = 0;
    const PROJECT_STATUS_SIGN = 1;
    public static $PROJECT_STATUS = [
        self::PROJECT_STATUS_UNSIGN => '跟进',
        self::PROJECT_STATUS_SIGN => '签约',
    ];

    const  PAYMENT_STATUS_UNPAY= 0;
    const  PAYMENT_STATUS_PAY= 1;
    const  PAYMENT_STATUS_PART= 2;
    public static $PAYMENT_STATUS = [
        self::PAYMENT_STATUS_UNPAY => '未付款',
        self::PAYMENT_STATUS_PAY => '已付款',
        self::PAYMENT_STATUS_PART => '部分付款',
    ];

    const  RENEW_STATUS_NOWUNRENEW = 0;
    const  RENEW_STATUS_UNRENEW = 1;
    const  RENEW_STATUS_RENEW = 2;
    public static $RENEW_STATUS = [
        self::RENEW_STATUS_UNRENEW => '不续签',
        self::RENEW_STATUS_NOWUNRENEW => '暂未续签',
        self::RENEW_STATUS_RENEW => '已续签',
    ];

    const  ARCHIVE_STATUS_FLASE =0;
    const  ARCHIVE_STATUS_TRUE =1;
    public static $ARCHIVE_STATUS = [
        self::ARCHIVE_STATUS_FLASE => '未归档',
        self::ARCHIVE_STATUS_TRUE => '已归档',
    ];

    const  DEMAND_STATUS_FOR_DUCKING = 0 ;
    const  DEMAND_STATUS_DUCKING = 1 ;
    const  DEMAND_STATUS_EMERGENCY =2 ;
    public static $DEMAND_STATUS = [
        self::DEMAND_STATUS_FOR_DUCKING =>'待对接',
        self::DEMAND_STATUS_DUCKING =>'对接中',
        self::DEMAND_STATUS_EMERGENCY =>'紧急',
    ];

    const  PROPETY_TYPE_PATENT =0;
    const  PROPETY_TYPE_COPYRIGHT =1;
    const  PROPETY_TYPE_TRADEMARK =2;
    const  PROPETY_TYPE_OTHER =3;
    public static $PROPETY_TYPE = [
        self::PROPETY_TYPE_PATENT =>'专利权',
        self::PROPETY_TYPE_COPYRIGHT =>'著作权',
        self::PROPETY_TYPE_TRADEMARK =>'商标权',
        self::PROPETY_TYPE_OTHER=>'其他',
    ];

    const  PROPETY_STATUS_UNAPPLY = 0;
    const  PROPETY_STATUS_APPLY = 1;
    public static $PROPETY_STATUS = [
        self::PROPETY_STATUS_UNAPPLY  =>'未申请',
        self::PROPETY_STATUS_APPLY  =>'已申请',
    ];

    const  NEWS_STATUS_UNREAD =0;
    const  NEWS_STATUS_READ =1;
    public static $NEWS_STATUS =[
        self::NEWS_STATUS_UNREAD =>'未读',
        self::NEWS_STATUS_READ =>'已读',
    ];
    const  NEWS_TYPE_PLAN =0;
    const  NEWS_TYPE_CONTRACT =1;
    const  NEWS_TYPE_PAYMENT =2 ;
    public static $NEWS_TYPE =[
        self::NEWS_TYPE_PLAN =>'计划',
        self::NEWS_TYPE_CONTRACT =>'合同',
        self::NEWS_TYPE_PAYMENT =>'付款',
    ];

    const  PLAN_STATUS_DNS=0;
    const  PLAN_STATUS_UNCOMPLETE =1;
    const  PLAN_STATUS_COMPLETE =2;
    public static $PLAN_STATUS =[
        self::PLAN_STATUS_DNS =>'未开始',
        self::PLAN_STATUS_UNCOMPLETE =>'未完成',
        self::PLAN_STATUS_COMPLETE =>'已完成',
    ];

    const  SHAREHOLDER_TYPE_LEGAL =0;
    const  SHAREHOLDER_TYPE_NATURAL =1;
    public static $SHAREHOLDER_TYPE =[
        self::SHAREHOLDER_TYPE_LEGAL =>'法人',
        self::SHAREHOLDER_TYPE_NATURAL =>'自然人',
    ];

    const PERMISSION_ROLE_ADMINISTRATOR=0;
    const PERMISSION_ROLE_VIP=1;
    const PERMISSION_ROLE_DIRECTOR=2;
    const PERMISSION_ROLE_HEAD=3;
    public static $PERMISSION_ROLE =[
        self::PERMISSION_ROLE_ADMINISTRATOR =>'超级管理员',
        self::PERMISSION_ROLE_VIP=>'VIP',
        self::PERMISSION_ROLE_DIRECTOR =>'项目总监',
        self::PERMISSION_ROLE_HEAD =>'项目负责人',
    ];


    const  PLAN_STATUS_D=1;
    const  PLAN_STATUS_F =2;
    const  PLAN_STATUS_P =3;
    public static $STATUS =[
        self::PLAN_STATUS_D =>'待审核',
        self::PLAN_STATUS_F =>'审核失败',
        self::PLAN_STATUS_P =>'审核通过',
        ];
}