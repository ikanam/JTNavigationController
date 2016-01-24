//
//  JTNavigationController.h
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JTWrapNavigationController : UINavigationController

@end



@interface JTWrapViewController : UIViewController

+ (JTWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController;

@end



@interface JTNavigationController : UINavigationController

@end

