//
//  JTBaseNavigationController.h
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTBaseNavigationController : UINavigationController

+ (instancetype)shareNavgationController;

@property (nonatomic, assign) BOOL fullScreenPopGestureEnable; /**<是否开启全屏侧滑返回手势*/

@property (nonatomic, strong) UIImage *backButtonImage; /**<返回按钮图片*/

@property (nonatomic, copy) NSArray<UIViewController *> *rootViewControllers; /**<真正的viewControllers*/

@end
