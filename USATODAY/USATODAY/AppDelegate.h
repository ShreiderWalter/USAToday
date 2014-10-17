//
//  AppDelegate.h
//  USATODAY
//
//  Created by Admin on 09.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController * mainViewController;
@property (strong, nonatomic) UINavigationController * navController;
@end
