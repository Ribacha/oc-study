//
//  SceneDelegate.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import "SceneDelegate.h"
#import "VCHomePage.h"
#import "VCClassification.h"
#import "VCMyClass.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window.frame = [UIScreen mainScreen].bounds;
    VCHomePage* vc1 = [[VCHomePage alloc] init];
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"推荐" image:[UIImage imageNamed:@"推荐.PNG"] selectedImage:[UIImage imageNamed:@"推荐.PNG"]];
    VCClassification* vc2 = [[VCClassification alloc] init];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"漫游" image:[UIImage imageNamed:@"漫游.PNG"] selectedImage:[UIImage imageNamed:@"漫游.PNG"]];
    VCMyClass* vc3 = [[VCMyClass alloc] init];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"我的.PNG"] selectedImage:[UIImage imageNamed:@"我的.PNG"]];
    UITabBarController* tabBarcontroller = [[UITabBarController alloc] init];
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    tabBarcontroller.viewControllers = @[nav1, nav2, nav3];
    tabBarcontroller.tabBar.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabBarcontroller;
    tabBarcontroller.tabBar.tintColor = [UIColor systemRedColor];//统一颜色的代码
    tabBarcontroller.tabBar.unselectedItemTintColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
}



- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
