//
//  JTSBViewController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/25.
//  Copyright © 2016年 JiananTian. All rights reserved.
//

#import "JTSBViewController.h"
#import "UIColor+RandomColor.h"

@interface JTSBViewController ()

@end

@implementation JTSBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    self.view.backgroundColor = [UIColor randomColor];
}

@end
