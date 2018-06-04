-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-05-11 09:30:55
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `schemal`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_token` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `group` tinyint(3) unsigned DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password_hash`, `nickname`, `password_reset_token`, `auth_key`, `status`, `group`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$13$QE0/xweSGf9onvRDVM.FkOAcgbJLYWF9PTphma16XcSrmpcxfY1fe', '超级管理员', NULL, 'Jbsh0SXk34qFVXmHz4U2HzBHDuIpYjO7', 10, 0, 1488772682, 1488772682),
(2, 'as', '$2y$13$jXT86o4h7YecYMTbTvz1F.hksEEFiFy0U3AffSdtbE9OrQPaJTKDa', 'qwe', NULL, 'YFbfzDr8e2JREIE7BIuvia6uqgJrQcGD', 10, 0, 1492773017, 1492773017);

-- --------------------------------------------------------

--
-- 表的结构 `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('超级管理员', '1', 1492934648),
('超级管理员', '2', 1492934688);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/create', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/delete', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/index', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/personal', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/update', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/uppersonal', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin-user/view', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/admin/assignment/*', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/assignment/assign', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/assignment/index', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/assignment/revoke', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/assignment/view', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/default/*', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/default/index', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/menu/*', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/menu/create', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/menu/delete', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/menu/index', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/menu/update', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/menu/view', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/*', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/assign', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/create', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/delete', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/index', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/remove', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/update', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/permission/view', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/*', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/assign', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/create', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/delete', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/index', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/remove', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/update', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/role/view', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/route/*', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/route/assign', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/route/create', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/route/index', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/route/refresh', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/route/remove', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/rule/*', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/rule/create', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/rule/delete', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/rule/index', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/rule/update', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/rule/view', 2, NULL, NULL, NULL, 1492933275, 1492933275),
('/admin/user/*', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/activate', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/change-password', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/delete', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/index', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/login', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/logout', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/request-password-reset', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/reset-password', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/signup', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/admin/user/view', 2, NULL, NULL, NULL, 1492933276, 1492933276),
('/commodity/*', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/commodity/create', 2, NULL, NULL, NULL, 1493206153, 1493206153),
('/commodity/delete', 2, NULL, NULL, NULL, 1493206153, 1493206153),
('/commodity/index', 2, NULL, NULL, NULL, 1493206153, 1493206153),
('/commodity/update', 2, NULL, NULL, NULL, 1493206153, 1493206153),
('/commodity/view', 2, NULL, NULL, NULL, 1493206153, 1493206153),
('/debug/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/debug/default/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/debug/default/index', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/debug/default/view', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/approve', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/create', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/delete', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/disapprove', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/index', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/update', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/designer/view', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/gii/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/gii/default/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/gii/default/action', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/gii/default/diff', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/gii/default/index', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/gii/default/preview', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/gii/default/view', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/orders/*', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/orders/create', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/orders/delete', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/orders/designer', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/orders/index', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/orders/supplier', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/orders/update', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/orders/view', 2, NULL, NULL, NULL, 1493206154, 1493206154),
('/site/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/site/admin', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/site/error', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/site/index', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/site/login', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/site/logout', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/approve', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/create', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/delete', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/disapprove', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/index', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/update', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/supplier/view', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/user/*', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/user/create', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/user/delete', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/user/index', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/user/update', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('/user/view', 2, NULL, NULL, NULL, 1492933277, 1492933277),
('供应商管理', 2, '供应商管理', NULL, NULL, 1492933472, 1492933472),
('供应商管理员', 1, '供应商管理员', NULL, NULL, 1492934304, 1492934304),
('商品管理', 2, '商品管理', NULL, NULL, 1493206209, 1493206209),
('用户管理', 2, '用户管理', NULL, NULL, 1492933494, 1492933494),
('用户管理员', 1, '用户管理员', NULL, NULL, 1492934380, 1492934380),
('管理员管理', 2, '管理员管理', NULL, NULL, 1492933424, 1492933424),
('订单管理', 2, '订单管理', NULL, NULL, 1493206776, 1493206776),
('设计师', 1, '设计师', NULL, NULL, 1493206588, 1493206588),
('设计师管理', 2, '设计师管理', NULL, NULL, 1492933523, 1492933523),
('设计师管理员', 1, '设计师管理员', NULL, NULL, 1492934342, 1492934342),
('超级管理员', 1, '超级管理员', NULL, NULL, 1492934192, 1493206838);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('管理员管理', '/admin-user/*'),
('管理员管理', '/admin-user/create'),
('管理员管理', '/admin-user/delete'),
('管理员管理', '/admin-user/index'),
('管理员管理', '/admin-user/personal'),
('管理员管理', '/admin-user/update'),
('管理员管理', '/admin-user/uppersonal'),
('管理员管理', '/admin-user/view'),
('商品管理', '/commodity/*'),
('商品管理', '/commodity/create'),
('商品管理', '/commodity/delete'),
('商品管理', '/commodity/index'),
('商品管理', '/commodity/update'),
('商品管理', '/commodity/view'),
('设计师管理', '/designer/*'),
('设计师管理', '/designer/approve'),
('设计师管理', '/designer/create'),
('设计师管理', '/designer/delete'),
('设计师管理', '/designer/disapprove'),
('设计师管理', '/designer/index'),
('设计师管理', '/designer/update'),
('设计师管理', '/designer/view'),
('订单管理', '/orders/*'),
('订单管理', '/orders/create'),
('订单管理', '/orders/delete'),
('订单管理', '/orders/designer'),
('订单管理', '/orders/index'),
('订单管理', '/orders/supplier'),
('订单管理', '/orders/update'),
('订单管理', '/orders/view'),
('供应商管理', '/supplier/*'),
('供应商管理', '/supplier/approve'),
('供应商管理', '/supplier/create'),
('供应商管理', '/supplier/delete'),
('供应商管理', '/supplier/disapprove'),
('供应商管理', '/supplier/index'),
('供应商管理', '/supplier/update'),
('供应商管理', '/supplier/view'),
('用户管理', '/user/*'),
('用户管理', '/user/create'),
('用户管理', '/user/delete'),
('用户管理', '/user/index'),
('用户管理', '/user/update'),
('用户管理', '/user/view'),
('供应商管理员', '供应商管理'),
('超级管理员', '供应商管理'),
('设计师', '商品管理'),
('超级管理员', '商品管理'),
('用户管理员', '用户管理'),
('超级管理员', '用户管理'),
('超级管理员', '管理员管理'),
('供应商管理员', '订单管理'),
('设计师', '订单管理'),
('超级管理员', '订单管理'),
('设计师管理员', '设计师管理'),
('超级管理员', '设计师管理');

-- --------------------------------------------------------

--
-- 表的结构 `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `browsing`
--

CREATE TABLE IF NOT EXISTS `browsing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `commodity_id` int(10) unsigned NOT NULL,
  `designer_id` int(10) unsigned NOT NULL,
  `groups` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `commodity_id` (`commodity_id`),
  KEY `designer_id` (`designer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `commodity`
--

CREATE TABLE IF NOT EXISTS `commodity` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comments` text,
  `price` double unsigned NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `commodity`
--

INSERT INTO `commodity` (`Id`, `name`, `comments`, `price`, `img`, `created_at`) VALUES
(3, '素雅围巾', '简单，大方', 34, '/res/upload/1/19/14932185561439.jpg', 1493218556),
(4, '淡雅围巾', '', 45, '/res/upload/1/ea/1493219104509.jpg', 1493219104),
(5, '文艺围巾', '', 56, '/res/upload/1/0b/14932191622866.png', 1493219162),
(6, '精致围巾', '', 43, '/res/upload/1/8d/14932192105327.png', 1493219210),
(7, '婉约', '', 45, '/res/upload/1/8b/14932693142470.png', 1493269314),
(8, 'as', '', 23, '/res/upload/1/73/14932808604869.jpg', 1493280860),
(9, '围巾', 'asd', 67, '/res/upload/1/b1/14944006291512.jpg', 1494400629);

-- --------------------------------------------------------

--
-- 表的结构 `crafts`
--

CREATE TABLE IF NOT EXISTS `crafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `timecosuming` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `designer`
--

CREATE TABLE IF NOT EXISTS `designer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_token` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `admin_uid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `designer`
--

INSERT INTO `designer` (`id`, `username`, `password_hash`, `nickname`, `password_reset_token`, `auth_key`, `status`, `created_at`, `updated_at`, `admin_uid`) VALUES
(1, 'asd', '$2y$13$y9vmPEYnSwrn7wbv18fevOE0m2Mn/wesgLi4OmeQlYm3qe7z5Jxmy', 'admin', NULL, 'tUDRYbT892rWQuNRvtRtfZ50bTfU2HJI', 2, 1493203783, 1494235589, 1),
(2, 'qwer', '$2y$13$xdkWZY64rCdaZ9iYkqqqveqw8JfvWM4ILJL5rc1YkVNStdoeNJ/ke', 'qwe', NULL, 'qGG8Wa_iNGmeaP4mVXnnUCDRBUAwV4P3', 3, 1494398143, 1494398374, 1),
(3, 'qwe', '$2y$13$naxpDfgN8jm3NKtLZYTVJeCRmkQRpkA0b5p.Ic3B6kidy6Cnd88V6', 'qwe', NULL, 'eQm-SJDaSfpfVmMGOsUakB1oItacZiSt', 1, 1494398266, 1494398266, NULL),
(4, 'zxc', '$2y$13$4kMcb66uay9Pkx.HN16KauT68DMcdjXc2McrJ3p.Kw6tPn/ea95jq', 'asd', NULL, 'ySP2UwSRTr10J1IpHxruVkhiJeteacHT', 1, 1494398722, 1494398722, NULL),
(5, 'zxcv', '$2y$13$EYDDPCPPIwdNuBhiJzArpOGHsxuSA5GmyXDQclj7sw.yUxLVRRKb.', 'qwe', NULL, 'Xw7UujyRxbfQ3Gd2Q7M5bW5qUhvLQpSi', 1, 1494399222, 1494399222, NULL),
(6, 'evil', '$2y$13$Gg1VSZm48wSIvtJS6uoQyuCUdBnCUjycnDhdXGX3Ab7xkPVt6tZG2', 'sdf', NULL, 'zaFwFMdXhfWszjpHWZq0Z_Uzygp-JTTV', 3, 1494400359, 1494400400, 1);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `name`, `parent`, `route`, `order`, `data`) VALUES
(1, '权限管理', NULL, '/admin/default/index', NULL, NULL),
(2, '管理员管理', NULL, '/admin-user/index', NULL, NULL),
(3, '供应商管理', NULL, '/supplier/index', NULL, NULL),
(4, '设计师管理', NULL, '/designer/index', NULL, NULL),
(5, '用户管理', NULL, '/user/index', NULL, NULL),
(6, '角色', NULL, '/admin/role/index', NULL, NULL),
(7, '商品管理', NULL, '/commodity/index', NULL, NULL),
(8, '订单管理', NULL, '/orders/index', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `commodity_id` int(10) unsigned NOT NULL,
  `designer_id` int(10) unsigned DEFAULT NULL,
  `supplier_id` int(10) unsigned DEFAULT NULL,
  `num` int(10) unsigned NOT NULL,
  `price` double unsigned NOT NULL,
  `States` int(11) NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `got_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `commodity_id` (`commodity_id`),
  KEY `designer_id` (`designer_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`id`, `users_id`, `commodity_id`, `designer_id`, `supplier_id`, `num`, `price`, `States`, `created_at`, `got_date`) VALUES
(1, 2, 7, 1, 1, 1, 45, 1, 1493269668, NULL),
(2, 2, 5, 1, NULL, 1, 56, 1, 1493280182, NULL),
(3, 2, 8, 1, 4, 1, 23, 1, 1493280881, NULL),
(4, 2, 8, NULL, NULL, 1, 23, 1, 1494170368, NULL),
(6, 7, 8, NULL, NULL, 1, 23, 1, 1494236087, NULL),
(7, 9, 8, NULL, NULL, 1, 23, 1, 1494398089, NULL),
(9, 11, 8, NULL, NULL, 1, 23, 1, 1494399164, NULL),
(10, 12, 8, NULL, NULL, 1, 23, 1, 1494399676, NULL),
(11, 13, 8, NULL, NULL, 1, 23, 1, 1494400014, NULL),
(12, 14, 8, 1, 1, 1, 23, 1, 1494400288, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `pattern`
--

CREATE TABLE IF NOT EXISTS `pattern` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `timecosuming` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `staying`
--

CREATE TABLE IF NOT EXISTS `staying` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `commodity_id` int(10) unsigned NOT NULL,
  `designer_id` int(10) unsigned NOT NULL,
  `groups` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `commodity_id` (`commodity_id`),
  KEY `designer_id` (`designer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_token` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `group` tinyint(3) unsigned DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `admin_uid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `admin_uid` (`admin_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `supplier`
--

INSERT INTO `supplier` (`id`, `username`, `password_hash`, `nickname`, `password_reset_token`, `auth_key`, `status`, `group`, `created_at`, `updated_at`, `parent_id`, `admin_uid`) VALUES
(1, 'qw', '$2y$13$FFHlo4n/cLy/bJfxE4teuuiOoHeM6Hrxr4.XVALqv/NSpZHGnLGfu', 'sd', NULL, 'OFQKtjyDNPO2KrPcPjh2WNtX26IRmMLd', 2, 0, 1493207322, 1494235473, NULL, 1),
(2, 'asdf', '$2y$13$dC34col1pe2SqdhVhFcvjOq6SjoHeLjA4PmtLOdP4lpNJBLv8E9.2', 'ad', NULL, 'NGjvmuOyeX_bNuuCjnNRScJ4EalA4lhr', 3, 0, 1493210837, 1493210848, NULL, 1),
(3, 'qwe', '$2y$13$ssFTF0KOcllT2.IzMwYh4..A6/e6.Mezw3CUNPRUTKVzMctsura22', 'qw', NULL, 'oMJ5cdoZDbHMGovoTS9wOksW5InxPY66', 2, 0, 1493218992, 1494236181, 2, 1),
(4, 'asdfg', '$2y$13$S/GatFJffLjb2Pdxn.9RAeoIlhicvSl9WAyd7Oj8AkSmTZ0LIuTn2', 'asd', NULL, '0yucGvn3olnXrF4ahX9iQMKDK3Z4KoIC', 1, 0, 1494172568, 1494172568, NULL, NULL),
(5, 'asd', '$2y$13$PVbvzNEKrx3gkQd518yePOjVTx64W6GWHN9KCVCF4QXgTVQmZ4NYW', 'asdf', NULL, 'mGQOWRYY_e-domu9wo_4wPrZMrFLWUlW', 3, 0, 1494235419, 1494235419, 2, NULL),
(6, 'asdfq', '$2y$13$adoWtT0uQA4B4fMPD935n.189dEnmW3zO7kw17J7FF2K9Inbbvn5S', 'asdq', NULL, 'QNlMUxEreV7-6VImcSCHmMhrYSCyKCLa', 1, 0, 1494399272, 1494399272, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_token` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `birthday` int(11) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password_hash`, `nickname`, `password_reset_token`, `auth_key`, `status`, `birthday`, `created_at`, `updated_at`) VALUES
(2, 'xx', '$2y$13$AGNHq3Cs5poTOwbZoO9O8ukxTEicfaAWfzv2HeTxIjvsWBzjTONYy', 'ad', NULL, 'eqMAfvhNv2J9LTqD2t5kS-GjIq_3t2M3', 10, 0, 1493269641, 1493269641),
(3, 'aqw', '$2y$13$/ADPliowEqZ4x83icCY/VedKrrqe1HP2c2XFh2yJmW2xTooHqvkTm', 'qw', NULL, '-NGxYxVEEA5gErgDv6L6ESR0SIBJ9zd1', 10, 1201622400, 1493280921, 1493280921),
(4, 'qweq', '$2y$13$UU4IY0oefgVYzVMdPehKfOLwxasb8uwh5REt/C108GaHDrDTo2DHm', 'dfh', NULL, 'qvD8GKOCdDAG9JgW1n3U2r3JhSzIQaG6', 10, 1482854400, 1494233005, 1494233005),
(5, 'aa', '$2y$13$TiwqYNDj.Avr85oNTlU2Y.3wMsCsvJp3uBQmZuBCi8o8G5/twJMKq', 'qwe', NULL, 'tquu0TRjbyelMt1ZC79gUJgzwX2h7woL', 10, 1234195200, 1494234949, 1494234949),
(7, 'zzz', '$2y$13$6k66O.KE2KKodYdV6S3q.uSE6vEBnItcYsb1Lj.LJNs9KFDsRMeFi', 'qwe', NULL, 'dChEyz2J2pnHuPnxyQlBtZmq5hhVxizX', 10, 1484064000, 1494236016, 1494236016),
(9, 'zxc', '$2y$13$gpFiWdUqNxN6rKhyc.J9keTc7TJkOej/jboXGFgyS5SAye.2ol3lK', 'asd', NULL, 'KYC8-BPDnEbwHZHERzhq_9Umqe16flYA', 10, 916675200, 1494398006, 1494398006),
(11, 'asdq', '$2y$13$7V0lQWWRhAQ/I3fBG8E2UudKzul6O47m6/biTh6LZuaewh4HQt7Ye', 'as', NULL, 'YcxawpGFgCo43ZBai6FXxALZyFIDgDwI', 10, 1087315200, 1494399098, 1494399098),
(12, 'zxca', '$2y$13$ZGeN3j0NAaDF4CX66Bp3Nu1hKm/nU6jQ8cllI5cLPLAd6QoQwQcue', 'zxc', NULL, 'Uc6AwU39uYDBGu_IHnQWWzl_HGF91hPs', 10, 1403539200, 1494399599, 1494399599),
(13, 'poi', '$2y$13$BBiMQHCtLR0ZTP/iHMLYDOU86rlTjlcV1CZot.jxSm4ykcKwQkUQK', 'po', NULL, 'U87XBaTAxHRP2FRqFvZLLILOf9wHDvNs', 10, 772214400, 1494399942, 1494399942),
(14, 'evil', '$2y$13$TBK.0AtAT7J5G9lkH4yMs.6A.8yG4LO7TlqHznaskkmxtfNV047zy', 'eci', NULL, '-h88XSudTdAlrnhwzNSrz7NOv0zhe6Gj', 10, 1245081600, 1494400218, 1494400218);

--
-- 限制导出的表
--

--
-- 限制表 `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `browsing`
--
ALTER TABLE `browsing`
  ADD CONSTRAINT `browsing_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `browsing_ibfk_2` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `browsing_ibfk_3` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `staying`
--
ALTER TABLE `staying`
  ADD CONSTRAINT `staying_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staying_ibfk_2` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staying_ibfk_3` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`admin_uid`) REFERENCES `admin_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
