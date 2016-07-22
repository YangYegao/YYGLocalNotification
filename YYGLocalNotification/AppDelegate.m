//
//  AppDelegate.m
//  YYGLocalNotification
//
//  Created by Jack on 16/7/22.
//  Copyright © 2016年 HaiDaFu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //after iOS8, we need do that
    UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    if (notification.alertBody) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tips" message:@"It's time to study" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        
        UIViewController *topPresentedViewController = self.window.rootViewController;
        while (topPresentedViewController.presentedViewController) {
            topPresentedViewController = topPresentedViewController.presentedViewController;
        }
        [topPresentedViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
