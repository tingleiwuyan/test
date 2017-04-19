/*管理员表*/
create table if not exists admin_user (
	id int unsigned not null auto_increment,	-- 用户id
	username varchar(50) not null,		-- 登录名
	password_hash varchar(100) not null, -- 登录密码
	nickname varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci not null,	-- 用户昵称，可能有一些表情符啥的
	password_reset_token varchar(100), -- 重置密码
	auth_key varchar(100) not null,	-- cookie auth
	status tinyint unsigned not null default 10,	-- 激活状态
	`group` tinyint unsigned default 0,	-- 管理员分组
	created_at int unsigned,	-- 创建时间
	updated_at int unsigned,	-- 最后修改时间
	primary key(id),
	unique (username)
)engine=InnoDB default charset=utf8mb4;

/*供应商表*/
create table if not exists supplier (
	id int unsigned not null auto_increment,	-- 用户id
	username varchar(50) not null,		-- 登录名
	password_hash varchar(100) not null, -- 登录密码
	nickname varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci not null,	-- 用户昵称，可能有一些表情符啥的
	password_reset_token varchar(100), -- 重置密码
	auth_key varchar(100) not null,	-- cookie auth
	status tinyint unsigned not null default 10,	-- 激活状态
	`group` tinyint unsigned default 0,	-- 供应商分组
	created_at int unsigned,	-- 创建时间
	updated_at int unsigned,	-- 最后修改时间
	parent_id int unsigned, -- 供应商主帐号id
	admin_uid int unsigned not null,	-- 管理员用户
	primary key(id),
	FOREIGN KEY (admin_uid) REFERENCES admin_user (id) ON DELETE CASCADE ON UPDATE CASCADE,
	unique (username)
)engine=InnoDB default charset=utf8mb4;

/*设计师表*/
create table if not exists designer(
	id int unsigned not null auto_increment,	-- 用户id
	username varchar(50) not null,		-- 登录名
	password_hash varchar(100) not null, -- 登录密码
	nickname varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci not null,	-- 用户昵称，可能有一些表情符啥的
	password_reset_token varchar(100), -- 重置密码
	auth_key varchar(100) not null,	-- cookie auth
	status tinyint unsigned not null default 10,	-- 激活状态
	created_at int unsigned,	-- 创建时间
	updated_at int unsigned,	-- 最后修改时间
	primary key(id),
	unique (username)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*用户表*/
create table if not exists user(
	id int unsigned not null auto_increment,	-- 用户id
	username varchar(50) not null,		-- 登录名
	password_hash varchar(100) not null, -- 登录密码
	nickname varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci not null,	-- 用户昵称，可能有一些表情符啥的
	password_reset_token varchar(100), -- 重置密码
	auth_key varchar(100) not null,	-- cookie auth
	status tinyint unsigned not null default 10,	-- 激活状态
	birthday int(11) DEFAULT NULL,
	created_at int unsigned,	-- 创建时间
	updated_at int unsigned,	-- 最后修改时间
	primary key(id),
	unique (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;