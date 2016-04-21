# JTNavigationController
一个类似网易云音乐和网易新闻页面切换效果的导航控制器.

通过分析网易云音乐实现的一个导航控制器.详情见[我的博文](http://jerrytian.com/2016/01/07/%E7%94%A8Reveal%E5%88%86%E6%9E%90%E7%BD%91%E6%98%93%E4%BA%91%E9%9F%B3%E4%B9%90%E7%9A%84%E5%AF%BC%E8%88%AA%E6%8E%A7%E5%88%B6%E5%99%A8%E5%88%87%E6%8D%A2%E6%95%88%E6%9E%9C/)

####效果图

![](https://github.com/JNTian/JTNavigationController/blob/master/demo.gif)

####集成方法
  
#####1. 代码方式
将原来的`UINavigationController`替换为`JTNavigationController`即可.
  
#####2. storyboard方式
修改`UINavigationController`的class为`JTNavigationController`

####相关操作
 1. push,pop,popToRoot的操作可以无需作调整,使用`self.navigationController`的方法就行,`popToViewController`稍微有些不同,详情见Demo中的代码.
 
 2. 修改状态栏颜色,用`preferredStatusBarStyle`或者`[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent]`(需要在info文件中加入View controller-based status bar appearance = NO).
 
 3. 返回按钮图标设置请修改`backButtonImage`属性.
 
 4. 修改`barTintColor`,增加`barButtonItem`等导航栏的操作都能放到viewDidLoad中,因为每个控制器都有属于自己的`UINavigationController`,所以不会影响到其他控制器的导航栏.
 
 5. 全屏返回手势,`fullScreenPopGestureEnable = YES`即可开启.
 
 6. 需要关闭或开启单独一个控制器的全屏返回手势,导入`UIViewController+JTNavigationExtension.h`头文件并设置`self.jt_fullScreenPopGestureEnabled;`即可.
 

