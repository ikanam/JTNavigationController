//
//  JTViewController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "JTViewController.h"
#import "UIColor+RandomColor.h"
#import "UIViewController+JTNavigationExtension.h"

@interface JTViewController ()

@end

@implementation JTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Title";
    self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    self.view.backgroundColor = [UIColor randomColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    
//    self.jt_fullScreenPopGestureEnabled = NO; //关闭当前控制器的全屏返回手势
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didTapNextButton {
    JTViewController *viewController = [[JTViewController alloc] init];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)didTapPopButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTapPopToButton:(id)sender {
    [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[0] animated:YES];
}

- (IBAction)didTapPopToRootButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


@end
