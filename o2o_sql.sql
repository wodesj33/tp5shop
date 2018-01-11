 #生活服务分类表
create table `o2o_category`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `parent_id` int(10) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #城市表
create table `o2o_city`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `uname` VARCHAR(50) NOT NULL DEFAULT '',
    `parent_id` int(10) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`),
    UNIQUE KEY uname(`uname`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #商圈表
create table `o2o_area`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `city_id` int(11) unsigned NOT NULL default 0,
    `parent_id` int(10) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`),
    KEY city_id(`city_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #商户表
create table `o2o_bis`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `emali` VARCHAR(50) NOT NULL DEFAULT '',
    `logo` VARCHAR(255) NOT NULL DEFAULT '',
    `licence_logo` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '营业执照',
    `description` text NOt NUll COMMENT '描述',
    `city_id` int(11) unsigned NOT NULL default 0,
    `city_path` varchar(50) NOT NULL default 0,
    `bank_info` varchar(50) NOT NULL default 0 COMMENT '银行信息',
    `money` decimal(20, 2) NOT NULL default '0.00' COMMENT '金额',
    `bank_name` varchar(50) NOT NULL default '' COMMENT '开户行信息',
    `bank_user` varchar(50) NOT NULL default '' COMMENT '开户信息',
    `faren` varchar(50) NOT NULL default '' COMMENT '法人',
    `faren_tel` varchar(50) NOT NULL default '' COMMENT '法人联系方式',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY city_id(`city_id`),
    KEY name(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #商户账号表
create table `o2o_bis_account`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `username` VARCHAR(20) NOT NULL DEFAULT '',
    `password` char(32) NOT NULL DEFAULT '',
    `code` varchar(10) NOT NULL DEFAULT '',
    `bis_id` int(11) unsigned NOT NULL default 0,
    `last_login_ip` varchar(20) NOT NULL DEFAULT '',
    `last_login_time` int(11) NOT NULL DEFAULT 0,
    `is_main` tinyint(1) unsigned NOT NULL default 0,
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY bis_id(`bis_id`),
    KEY username(`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #商户门店表#
create table `o2o_bis_location`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `logo` VARCHAR(255) NOT NULL DEFAULT '',
    `address` VARCHAR(255) NOT NULL DEFAULT '',
    `tel` VARCHAR(20) NOT NULL DEFAULT '',
    `contact` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '联系人',
    `xpoint` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '经度',
    `ypoint` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '纬度',
    `bis_id` int(11) unsigned NOT NULL default 0,
    `open_time` int(11) unsigned NOT NULL default 0 COMMENT '营业时间',
    `content` text NOT NULL COMMENT '门店介绍',
    `is_main` tinyint(1) unsigned NOT NULL default 0 COMMENT '是否是总店',
    `api_address` VARCHAR(255) NOT NULL DEFAULT '',
    `city_id` int(11) unsigned NOT NULL default 0,
    `city_path` varchar(50) NOT NULL default 0,
    `category_id` int(11) unsigned NOT NULL default 0,
    `category_path` varchar(50) NOT NULL default '',
    `bank_info` varchar(50) NOT NULL default 0 COMMENT '银行信息',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY city_id(`city_id`),
    KEY bis_id(`bis_id`),
    KEY category_id(`category_id`),
    KEY name(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #团购商品表
create table `o2o_deal`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `name` varchar(100) NOT NULL DEFAULT '',
    `category_id` int(11) NOT NULL DEFAULT 0,
    `se_category_id` int(11) NOT NULL DEFAULT 0 COMMENT '二级栏目',
    `bis_id` int(11) NOT NULL DEFAULT 0,
    `location_ids` varchar(100) NOT NULL default '' COMMENT '所属门店的id数组',
    `image` varchar(200) NOT NULL default '' COMMENT '商品图片',
    `description` text NOT NULL COMMENT '商品介绍',
    `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '商品开始时间',
    `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '商品结束时间',
    `origin_price` decimal(20, 2) NOT NULL DEFAULT '0.00' COMMENT '商品原价',
    `current_price` decimal(20, 2) NOT NULL DEFAULT '0.00' COMMENT '当前售价',
    `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品所属城市',
    `buy_count` int(11) NOT NULL DEFAULT 0 COMMENT '商品总销量',
    `total_count` int(11) NOT NULL DEFAULT 0 COMMENT '商品总库存',
    `coupons_begin_time` int(11) NOT NULL DEFAULT 0 COMMENT '团购券开始时间',
    `coupons_end_time` int(11) NOT NULL DEFAULT 0 COMMENT '团购券结束时间',
    `xpoint` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '经度',
    `ypoint` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '纬度',
    `bis_account_id` int(10) NOT NULL DEFAULT 0 COMMENT '提交商品的商家',
    `balance_price` decimal(20, 2) NOT NULL DEFAULT '0.00' COMMENT '结算价',
    `notes` text NOT NULL COMMENT '商品提示',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    key category_id (`category_id`),
    key se_category_id (`se_category_id`),
    key city_id (`city_id`),
    key start_time (`start_time`),
    key end_time (`end_time`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #用户表
create table `o2o_user`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `username` VARCHAR(20) NOT NULL DEFAULT '',
    `password` char(32) NOT NULL DEFAULT '',
    `code` varchar(10) NOT NULL DEFAULT '',
    `bis_id` int(11) unsigned NOT NULL default 0,
    `last_login_ip` varchar(20) NOT NULL DEFAULT '',
    `last_login_time` int(11) NOT NULL DEFAULT 0,
    `email` varchar(30) NOT NULL DEFAULT '',
    `mobile` varchar(20) NOT NULL default '',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY username(`username`),
    UNIQUE KEY email(`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
 #推荐位表
create table `o2o_feature`(
    `id` int(11) unsigned NOT NULL auto_increment,
    `type` tinyint(1) NOT NULL default 0 COMMENT '推荐位分类',
    `title` varchar(30) NOT NULL DEFAULT '',
    `image` varchar(255) NOT NULL default '',
    `url` varchar(255) NOT NULL default '',
    `description` varchar(255) NOT NULL default '' COMMENT '描述',
    `listorder` int(8) unsigned NOT NULL default 0,
    `status` tinyint(1) NOT NULL DEFAULT 0,
    `create_time` int(11) unsigned NOT NULL default 0,
    `update_time` int(11) unsigned NOT NULL default 0,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;