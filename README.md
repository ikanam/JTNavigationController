# JTNavigationController
一个类似网易云音乐和网易新闻页面切换效果的导航控制器.

通过分析网易云音乐实现的一个导航控制器.详情见[我的博文](http://jerrytian.com/2016/01/23/yong-revealfen-xi-wang-yi-yun-yin-le-de-dao-hang-kong-zhi-qi-qie-huan-xiao-guo/)

####集成方法
 1. 替换原`window`的`rootViewController`为`[[JTBaseNavigationController alloc] initWithRootViewController:原rootViewController]`
 2. 替换原`UINavigationController`为`JTNavigationController`
 3. 默认的返回按钮图标在`JTBaseNavigationController.h`中修改
 
 
