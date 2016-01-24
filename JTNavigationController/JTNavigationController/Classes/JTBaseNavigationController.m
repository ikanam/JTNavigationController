//
//  JTBaseNavigationController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "JTBaseNavigationController.h"

@interface JTBaseWrapViewController : UIViewController

@end

@implementation JTBaseWrapViewController

- (UIViewController *)childViewControllerForStatusBarStyle {
    return [self rootViewController];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return [self rootViewController];
}

- (UIViewController *)rootViewController {
    return self.childViewControllers.firstObject;
}


@end

@interface JTBaseNavigationController () <UINavigationControllerDelegate>

@end

@implementation JTBaseNavigationController


+ (instancetype)shareNavgationController {
    
    static JTBaseNavigationController *baseNavigationController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseNavigationController = [[JTBaseNavigationController alloc] init];
    });
    
    return baseNavigationController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = nil;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    JTBaseNavigationController *baseNavigationController = [JTBaseNavigationController shareNavgationController];
    baseNavigationController.viewControllers = @[[self wrapViewConrollerWithViewController:rootViewController]];
    return baseNavigationController;
}

- (UIViewController *)wrapViewConrollerWithViewController:(UIViewController *)viewController {
    JTBaseWrapViewController *wrapViewController = [[JTBaseWrapViewController alloc] init];
    [wrapViewController.view addSubview:viewController.view];
    [wrapViewController addChildViewController:viewController];
    return wrapViewController;
}

- (NSArray<UIViewController *> *)rootViewControllers {
    NSMutableArray<UIViewController *> *rootViewControllers = [NSMutableArray array];
    for (UIViewController *viewControllers in self.viewControllers) {
        UINavigationController *wrapNavController = viewControllers.childViewControllers.firstObject;
        [rootViewControllers addObject:wrapNavController.viewControllers.firstObject];
    }
    return rootViewControllers.copy;
}

//解决某些情况push会卡死的情况
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isRootVC = viewController == navigationController.viewControllers.firstObject;
    navigationController.interactivePopGestureRecognizer.enabled = !isRootVC;
}

@end
