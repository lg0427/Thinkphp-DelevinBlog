/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : Delevin、博客

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-12-01 23:34:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for _article
-- ----------------------------
DROP TABLE IF EXISTS `_article`;
CREATE TABLE `_article` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章表主键',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示 1是 0否',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1是 0否',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶 1是 0否',
  `is_original` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否原创',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `cid` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _article
-- ----------------------------
INSERT INTO `_article` VALUES ('17', '测试文章标题', 'Delevin、', '&lt;p&gt;测试文章内容&lt;img alt=&quot;Delevin、博客&quot; src=&quot;/Upload/image/ueditor/20150601/1433171136139793.jpg&quot; title=&quot;Delevin、博客&quot;/&gt;&lt;/p&gt;', '关键词,多个', '测试文章描述', '1', '0', '1', '1', '376', '1432649909', '28');

-- ----------------------------
-- Table structure for _article_pic
-- ----------------------------
DROP TABLE IF EXISTS `_article_pic`;
CREATE TABLE `_article_pic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '图片路径',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属文章id',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _article_pic
-- ----------------------------
INSERT INTO `_article_pic` VALUES ('11', '/Upload/image/ueditor/20150601/1433171136139793.jpg', '17');

-- ----------------------------
-- Table structure for _article_tag
-- ----------------------------
DROP TABLE IF EXISTS `_article_tag`;
CREATE TABLE `_article_tag` (
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _article_tag
-- ----------------------------
INSERT INTO `_article_tag` VALUES ('17', '20');

-- ----------------------------
-- Table structure for _category
-- ----------------------------
DROP TABLE IF EXISTS `_category`;
CREATE TABLE `_category` (
  `cid` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类主键id',
  `cname` varchar(15) NOT NULL DEFAULT '' COMMENT '分类名称',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '父级栏目id',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _category
-- ----------------------------
INSERT INTO `_category` VALUES ('28', '测试分类', '测试分类关键词', '测试分类描述', '1', '0');

-- ----------------------------
-- Table structure for _chat
-- ----------------------------
DROP TABLE IF EXISTS `_chat`;
CREATE TABLE `_chat` (
  `chid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '碎言id',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  `content` text NOT NULL COMMENT '内容',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`chid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _chat
-- ----------------------------
INSERT INTO `_chat` VALUES ('2', '1432827004', '测试随言碎语', '1', '0');
INSERT INTO `_chat` VALUES ('3', '1444529995', '测试碎言', '1', '0');

-- ----------------------------
-- Table structure for _comment
-- ----------------------------
DROP TABLE IF EXISTS `_comment`;
CREATE TABLE `_comment` (
  `cmtid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ouid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户id 关联oauth_user表的id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：文章评论',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `aid` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` text NOT NULL COMMENT '内容',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论日期',
  `status` tinyint(1) unsigned NOT NULL COMMENT '1:已审核 0：未审核',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`cmtid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _comment
-- ----------------------------
INSERT INTO `_comment` VALUES ('19', '1', '1', '0', '17', '测试评论&lt;img src=&quot;/Public/emote/tuzki/t_0002.gif&quot; title=&quot;Love&quot; alt=&quot;Delevin、博客&quot;&gt;', '1445747059', '1', '0');
INSERT INTO `_comment` VALUES ('21', '1', '1', '19', '17', '测试回复', '1447943018', '1', '0');

-- ----------------------------
-- Table structure for _config
-- ----------------------------
DROP TABLE IF EXISTS `_config`;
CREATE TABLE `_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项键名',
  `value` text COMMENT '配置项键值 1表示开启 0 关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _config
-- ----------------------------
INSERT INTO `_config` VALUES ('1', 'WEB_NAME', 'Delevin、博客');
INSERT INTO `_config` VALUES ('2', 'WEB_KEYWORDS', 'Delevin、,帅白,技术博客,个人博客,Delevin、博客');
INSERT INTO `_config` VALUES ('3', 'WEB_DESCRIPTION', 'Delevin、的个人技术博客,Delevin、博客官方网站');
INSERT INTO `_config` VALUES ('4', 'WEB_STATUS', '1');
INSERT INTO `_config` VALUES ('5', 'ADMIN_PASSWORD', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `_config` VALUES ('6', 'WATER_TYPE', '1');
INSERT INTO `_config` VALUES ('7', 'TEXT_WATER_WORD', 'www.iswoole.com');
INSERT INTO `_config` VALUES ('8', 'TEXT_WATER_TTF_PTH', './Public/static/font/ariali.ttf');
INSERT INTO `_config` VALUES ('9', 'TEXT_WATER_FONT_SIZE', '15');
INSERT INTO `_config` VALUES ('10', 'TEXT_WATER_COLOR', '#008CBA');
INSERT INTO `_config` VALUES ('11', 'TEXT_WATER_ANGLE', '0');
INSERT INTO `_config` VALUES ('12', 'TEXT_WATER_LOCATE', '9');
INSERT INTO `_config` VALUES ('13', 'IMAGE_WATER_PIC_PTAH', './Upload/image/logo/logo.png');
INSERT INTO `_config` VALUES ('14', 'IMAGE_WATER_LOCATE', '9');
INSERT INTO `_config` VALUES ('15', 'IMAGE_WATER_ALPHA', '80');
INSERT INTO `_config` VALUES ('16', 'WEB_CLOSE_WORD', '网站升级中，请稍后访问。');
INSERT INTO `_config` VALUES ('17', 'WEB_ICP_NUMBER', '豫ICP备14009546号-3');
INSERT INTO `_config` VALUES ('18', 'ADMIN_EMAIL', 'baijunyao@www.iswoole.com');
INSERT INTO `_config` VALUES ('19', 'COPYRIGHT_WORD', '本文为Delevin、原创文章,转载无需和我联系,但请注明来自Delevin、博客www.iswoole.com');
INSERT INTO `_config` VALUES ('20', 'QQ_APP_ID', '');
INSERT INTO `_config` VALUES ('21', 'CHANGYAN_APP_ID', 'cyrKRbJ5N');
INSERT INTO `_config` VALUES ('22', 'CHANGYAN_CONF', 'prod_c654661caf5ab6da98742d040413815b');
INSERT INTO `_config` VALUES ('23', 'WEB_STATISTICS', '');
INSERT INTO `_config` VALUES ('24', 'CHANGEYAN_RETURN_COMMENT', '');
INSERT INTO `_config` VALUES ('25', 'AUTHOR', 'Delevin、');
INSERT INTO `_config` VALUES ('26', 'QQ_APP_KEY', '');
INSERT INTO `_config` VALUES ('27', 'CHANGYAN_COMMENT', '');
INSERT INTO `_config` VALUES ('28', 'BAIDU_SITE_URL', '');
INSERT INTO `_config` VALUES ('29', 'DOUBAN_API_KEY', '');
INSERT INTO `_config` VALUES ('30', 'DOUBAN_SECRET', '');
INSERT INTO `_config` VALUES ('31', 'RENREN_API_KEY', '');
INSERT INTO `_config` VALUES ('32', 'RENREN_SECRET', '');
INSERT INTO `_config` VALUES ('33', 'SINA_API_KEY', '');
INSERT INTO `_config` VALUES ('34', 'SINA_SECRET', '');
INSERT INTO `_config` VALUES ('35', 'KAIXIN_API_KEY', '');
INSERT INTO `_config` VALUES ('36', 'KAIXIN_SECRET', '');
INSERT INTO `_config` VALUES ('37', 'SOHU_API_KEY', '');
INSERT INTO `_config` VALUES ('38', 'SOHU_SECRET', '');
INSERT INTO `_config` VALUES ('39', 'GITHUB_CLIENT_ID', '');
INSERT INTO `_config` VALUES ('40', 'GITHUB_CLIENT_SECRET', '');
INSERT INTO `_config` VALUES ('41', 'IMAGE_TITLE_ALT_WORD', 'Delevin、博客');
INSERT INTO `_config` VALUES ('42', 'EMAIL_SMTP', '');
INSERT INTO `_config` VALUES ('43', 'EMAIL_USERNAME', '');
INSERT INTO `_config` VALUES ('44', 'EMAIL_PASSWORD', '');
INSERT INTO `_config` VALUES ('45', 'EMAIL_FROM_NAME', '');
INSERT INTO `_config` VALUES ('46', 'COMMENT_REVIEW', '1');
INSERT INTO `_config` VALUES ('47', 'COMMENT_SEND_EMAIL', '0');
INSERT INTO `_config` VALUES ('48', 'EMAIL_RECEIVE', '');

-- ----------------------------
-- Table structure for _link
-- ----------------------------
DROP TABLE IF EXISTS `_link`;
CREATE TABLE `_link` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lname` varchar(50) NOT NULL DEFAULT '' COMMENT '链接名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示 1是 0否',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1是 0否',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _link
-- ----------------------------
INSERT INTO `_link` VALUES ('2', 'Delevin、博客', 'http://www.iswoole.com', '1', '1', '0');

-- ----------------------------
-- Table structure for _oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `_oauth_user`;
CREATE TABLE `_oauth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的本站用户id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1：QQ  2：新浪微博 3：豆瓣 4：人人 5：开心网',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT 'access_token token',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `login_times` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for _tag
-- ----------------------------
DROP TABLE IF EXISTS `_tag`;
CREATE TABLE `_tag` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签主键',
  `tname` varchar(10) NOT NULL DEFAULT '' COMMENT '标签名',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _tag
-- ----------------------------
INSERT INTO `_tag` VALUES ('20', '测试标签');
