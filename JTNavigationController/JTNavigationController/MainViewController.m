//
//  MainViewController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "MainViewController.h"
#import "JTNavigationController.h"
#import "JTViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JTViewController *firstVC = [[JTViewController alloc] init];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    firstVC.title = @"First";
    firstVC.tabBarItem = firstItem;
    JTNavigationController *firstNav = [[JTNavigationController alloc] initWithRootViewController:firstVC];
    firstNav.fullScreenPopGestureEnabled = YES;
    
    JTViewController *secondVC = [[JTViewController alloc] init];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    secondVC.title = @"Second";
    secondVC.tabBarItem = secondItem;
    JTNavigationController *secondNav = [[JTNavigationController alloc] initWithRootViewController:secondVC];
    secondNav.fullScreenPopGestureEnabled = NO;
    
    self.viewControllers = @[firstNav, secondNav];
}

@end
