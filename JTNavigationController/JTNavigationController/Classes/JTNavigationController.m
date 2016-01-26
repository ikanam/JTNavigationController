//
//  JTNavigationController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "JTNavigationController.h"
#import "JTBaseNavigationController.h"

#define kDefaultBackImageName @"backImage"

#pragma mark - JTWrapNavigationController

@interface JTWrapNavigationController : UINavigationController

@end

@implementation JTWrapNavigationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [[JTBaseNavigationController shareNavgationController] popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
   return [[JTBaseNavigationController shareNavgationController] popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSInteger index = [[JTBaseNavigationController shareNavgationController].rootViewControllers indexOfObject:viewController];
    return [[JTBaseNavigationController shareNavgationController] popToViewController:[JTBaseNavigationController shareNavgationController].viewControllers[index] animated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    UIImage *backButtonImage;
    
    if ([JTBaseNavigationController shareNavgationController].backButtonImage) {
        backButtonImage = [JTBaseNavigationController shareNavgationController].backButtonImage;
    } else {
        backButtonImage = [UIImage imageNamed:kDefaultBackImageName];
    }
    
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(didTapBackButton)];
    
    [[JTBaseNavigationController shareNavgationController] pushViewController:[JTWrapViewController wrapViewControllerWithViewController:viewController] animated:animated];
}

- (void)didTapBackButton {
    [[JTBaseNavigationController shareNavgationController] popViewControllerAnimated:YES];
}

@end

#pragma mark - JTWrapViewController

@implementation JTWrapViewController

+ (JTWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController {
    
    JTWrapNavigationController *wrapNavController = [[JTWrapNavigationController alloc] init];
    wrapNavController.viewControllers = @[viewController];
    
    JTWrapViewController *wrapViewController = [[JTWrapViewController alloc] init];
    [wrapViewController.view addSubview:wrapNavController.view];
    [wrapViewController addChildViewController:wrapNavController];
    
    return wrapViewController;
}

- (UITabBarItem *)tabBarItem {
    return [self rootViewController].tabBarItem;
}

- (NSString *)title {
    return [self rootViewController].title;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return [self rootViewController];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return [self rootViewController];
}

- (UIViewController *)rootViewController {
    JTWrapNavigationController *wrapNavController = self.childViewControllers.firstObject;
    return wrapNavController.viewControllers.firstObject;
}

@end

#pragma mark - JTNavigationController

@interface JTNavigationController ()

@end

@implementation JTNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super init]) {
        self.viewControllers = @[[JTWrapViewController wrapViewControllerWithViewController:rootViewController]];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.viewControllers = @[[JTWrapViewController wrapViewControllerWithViewController:self.viewControllers.firstObject]];
    }
    return self;
}

@end
