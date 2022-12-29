//
//  AppDelegate.m
//  ZTUIStyle
//
//  Created by 钟达烽 on 2022/12/27.
//

#import "AppDelegate.h"
#import "demo/DemoListController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.创建根控制器
    DemoListController *launchController = [[DemoListController alloc]init];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:launchController];
//    navController.navigationBarHidden = YES;
    navController.navigationBar.translucent = NO;
    navController.navigationBar.barTintColor = [UIColor orangeColor];
        
    //3.显示窗口
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    _navController = navController;
    
    return YES;
}

@end
