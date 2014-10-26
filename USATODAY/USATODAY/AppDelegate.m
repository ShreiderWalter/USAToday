//
//  AppDelegate.m
//  USATODAY
//
//  Created by Admin on 09.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LogoSplash.h"

@implementation AppDelegate

UIImageView * splashScreen;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor grayColor];
    self.mainViewController = [[MainViewController alloc]
                               initWithNibName:@"MainViewController" bundle:nil];
    self.navController = [[UINavigationController alloc]
                          initWithRootViewController:self.mainViewController];
    self.window.rootViewController = self.navController;
    
    splashScreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"usa_today_logo.png"] ];
    splashScreen.frame = self.window.bounds;
    [[self.mainViewController view] addSubview:splashScreen];
    [[self.mainViewController view] bringSubviewToFront:splashScreen];
    //[UIView transitionWithView:self.window duration:3.0f options:UIViewAnimationOptionTransitionNone animations:^(void){splashScreen.alpha = 1.0f;} completion:^(BOOL finished){[splashScreen removeFromSuperview];} ];
    NSDate * d = [NSDate dateWithTimeIntervalSinceNow: 4.0];
    NSTimer * t = [[NSTimer alloc] initWithFireDate: d interval: 1 target: self selector:@selector(onTick:) userInfo:nil repeats:YES];
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:t forMode: NSDefaultRunLoopMode];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)onTick:(NSTimer *)timer{
    [splashScreen removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
