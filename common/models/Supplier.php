<?php
namespace common\models;

use backend\models\AdminUser;
use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

/**
 * 供应商Supplier model
 *
 * @property integer $id
 * @property string $username 登录名
 * @property string $password_hash 登录密码
 * @property string $nickname 昵称
 * @property string $password_reset_token 重置密码
 * @property string $auth_key cookie记住我key
 * @property integer $status 是否激活用户
 * @property integer $group 管理员组
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $password write-only password
 */
class Supplier extends ActiveRecord implements IdentityInterface
{
    const STATUS_DELETED = 1;
    const STATUS_ACTIVE = 2;
    const STATUS_PASS = 3;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%supplier}}';
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'nickname', 'password_hash'], 'required'],
            [['username', 'nickname'], 'string', 'max' => 50],
            [['username', 'nickname'], 'validateName'],
            ['status', 'default', 'value' => self::STATUS_ACTIVE],
            ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED,self::STATUS_PASS]],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => '登录名',
            'password_hash' => '登录密码',
            'nickname' => '供应商昵称',
            'password_reset_token' => '重置密码',
            'auth_key' => 'cookie auth',
            'status' => '状态',
            'group' => '供应商分组',
            'admin_uid'=>'审核者',
            'created_at' => '创建于',
            'updated_at' => '更新于',
        ];
    }

    /**
     * username nickname要唯一
     */
    public function validateName($attribute, $params) {
        $user = self::findOne( [$attribute => $this->$attribute] );
        if(!empty($user) && $user->id != $this->id) {
            $this->addError($attribute, '已存在该' . $attribute);
        }
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'password_reset_token' => $token,
            'status' => self::STATUS_ACTIVE,
        ]);
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }

    /**
     * 创建用户
     * @param array $data ['username', 'nickname', 'password']
     * @return boolean|\common\models\User
     */
    public static function createUser($data) {
        $user = new Supplier();
        if(!is_array($data)) {
            $user->addError('username', '数据为空');
        }
        else if(!isset($data['password']) || strlen($data['password']) < 6) {
            $user->addError('password', '密码长度不能小于6');
        }
        else {
            $user->load($data, '');
            $user->setPassword($data['password']);
            $user->generateAuthKey();
            $user->save();
        }
        return $user;
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    public function getPassword()
    {
        return '';
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }
    public function getAdminU()
    {
        return $this->hasOne(AdminUser::className(), ['id' => 'admin_uid']);
    }
}
