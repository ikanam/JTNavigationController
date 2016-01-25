# JTNavigationController
一个类似网易云音乐和网易新闻页面切换效果的导航控制器.

通过分析网易云音乐实现的一个导航控制器.详情见[我的博文](http://jerrytian.com/2016/01/23/yong-revealfen-xi-wang-yi-yun-yin-le-de-dao-hang-kong-zhi-qi-qie-huan-xiao-guo/)

####效果图

![](https://github.com/JNTian/JTNavigationController/blob/master/demo.gif)

####集成方法
 1. 替换原`window`的`rootViewController`为`[[JTBaseNavigationController alloc] initWithRootViewController:原rootViewController]`.
 
 2. 将需要实现该动画效果的`UINavigationController`替换为为`JTNavigationController`


####相关操作
 1. push,pop,popToRoot的操作可以无需作调整,使用`self.navigationController`的方法就行,`popToViewController`稍微有些不同,详情见Demo中的代码.
 
 2. 修改状态栏颜色,用`preferredStatusBarStyle`或者`[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent]`(需要在info文件中加入View controller-based status bar appearance = NO).
 
 3. 默认的返回按钮图标在`JTBaseNavigationController.h`中修改,也可以单独修改`leftBarButtonItem`.
 
 4. 修改`barTintColor`,增加`barButtonItem`等导航栏的操作都能放到viewDidLoad中,因为每个控制器都有属于自己的`UINavigationController`,所以不会影响到其他控制器的导航栏.
 5. 
 
####已知问题
 1. 暂不支持storyboard,有时间我看看
