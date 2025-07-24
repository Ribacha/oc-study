//
//  AppDelegate.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/19.
//

#import "AppDelegate.h"
#import "LookinServer/LookinServer.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        [appearance configureWithOpaqueBackground]; // 不透明背景
        appearance.backgroundColor = [UIColor colorWithRed:79 / 255.0f green:141 / 255.0f blue:198 / 255.0f alpha:1.0];
        appearance.titleTextAttributes = @{
            NSForegroundColorAttributeName: [UIColor whiteColor],
            NSFontAttributeName: [UIFont boldSystemFontOfSize:18]
        };
        
        UINavigationBar *navBar = [UINavigationBar appearance];
        navBar.standardAppearance = appearance;
        navBar.scrollEdgeAppearance = appearance;
        navBar.compactAppearance = appearance;
        navBar.tintColor = [UIColor whiteColor]; // 按钮颜色
    } else {
        // iOS 12 及以下老方式（你已经写了这部分也 OK）
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:79 / 255.0f green:141 / 255.0f blue:198 / 255.0f alpha:1.0]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{
            NSForegroundColorAttributeName: [UIColor whiteColor],
            NSFontAttributeName: [UIFont boldSystemFontOfSize:18]
        }];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    }

    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
