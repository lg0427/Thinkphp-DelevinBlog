# thinkphp-bjyblog

## 链接
- 博客：https://www.delevin.top/  
- github：https://github.com/q546530715/www.delevin.top.git   
#
- 源博客：http://baijunyao.com   
- 源github：https://github.com/baijunyao/thinkphp-bjyblog   
- oschina：http://git.oschina.net/shuaibai123/thinkbjy   

## 源简介 - 感谢该作者开源
闲暇之时使用thinkphp开发了一个个人博客用来整理技能知识；  

如今博客的功能基本已经齐备；特开源以供各类猿们免费使用;  

亦可以作为初学thinkphp的同学们的参考源代码；  

此博客程序前后台页面以及逻辑代码的都由我手工打造；没有版权限制；可以随意折腾；

想研究支付宝、微信支付、邮件发送、短信通知验证码发送、oss云存储、融云即时通讯、友盟推送、Memcached缓存、权限管理、等更多功能的可以参考进阶版的bjyadmin https://github.com/baijunyao/thinkphp-bjyadmin  


## 使用说明
1. 请将项目内的所有文件直接放在根目录下；不要多层目录；  
例如正确：www/;错误：www/thinkbjy/；
2. 后台登录密码默认为admin；
3. 如果确认开启了mod_rewrite  
请将/Application/Common/Conf/config.php中的URL_MODEL改为2以优化url  
未开启路由：https://www.delevin.top/index.php/Home/Index/article/aid/60  
开启路由后：https://www.delevin.top/article/60
4. 把根目录下的robots.txt中的delevin.top改为自己的域名；

## 针对thinkphp的改进优化；
1. 修复tinkphp的session设置周期无效的bug；
2. 自定义标签 /Application/Common/Tag/My.class.php；
3. 将html视图页面分离；

## 项目介绍
1. 去除原本开源产品的第三方登陆
2. 带表情的ajax无限级评论系统；
3. PHPMail邮件系统；
4. 引入多说评论插件
5. ueditor 百度富文本编辑器；
7. font-awesome；
8. iCheck；

