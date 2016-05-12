//
//  UIViewController+JTNavigationExtension.h
//  JTNavigationController
//
//  Created by Tian on 16/2/17.
//  Copyright © 2016年 JiananTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTNavigationController.h"

@interface UIViewController (JTNavigationExtension)

@property (nonatomic, assign) BOOL jt_fullScreenPopGestureEnabled;

@property (nonatomic, weak) JTNavigationController *jt_navigationController;

@end
