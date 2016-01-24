//
//  JTViewController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "JTViewController.h"
#import "UIColor+RandomColor.h"
#import "JTBaseNavigationController.h"

@interface JTViewController ()

@end

@implementation JTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Title";
    self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    self.view.backgroundColor = [UIColor randomColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didTapNextButton {
    JTViewController *viewController = [[JTViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)didTapPopButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTapPopToButton:(id)sender {
    [self.navigationController popToViewController:[JTBaseNavigationController shareNavgationController].rootViewControllers.firstObject animated:YES];
}

- (IBAction)didTapPopToRootButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


@end
