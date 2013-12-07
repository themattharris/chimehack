//
//  UCFAppDelegate.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef All rights reserved.
//

#import "UCFAppDelegate.h"

#import "UCFNavigationController.h"
#import "UCFSignupViewController.h"
#import "UCFMainTabController.h"

#import "UCFSettings.h"

@interface UCFAppDelegate () <UCFSignupViewControllerDelegate>
@end

@implementation UCFAppDelegate
{
    UCFNavigationController *_rootNavigationController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _rootNavigationController = [[UCFNavigationController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = _rootNavigationController;
    
    [self.window makeKeyAndVisible];
    
    if (![[UCFSettings sharedInstace] signedInUserId]) {
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            UCFSignupViewController *controller = [[UCFSignupViewController alloc] init];
            controller.delegate = self;
            
            UCFNavigationController *navController = [[UCFNavigationController alloc] initWithRootViewController:controller];
            [_rootNavigationController presentViewController:navController animated:YES completion:NULL];
        });
    } else {
        [self signupViewControllerDidComplete:nil];
    }
    

    return YES;
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

- (void)signupViewControllerDidComplete:(UCFSignupViewController *)controller
{
    UCFMainTabController *tabController = [[UCFMainTabController alloc] init];
    NSArray *controllers = @[tabController];
    [_rootNavigationController setViewControllers:controllers animated:YES];
    [_rootNavigationController setNavigationBarHidden:NO animated:YES];
    
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

@end
