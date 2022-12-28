//
//  AppDelegate.m
//  ZTUIStyle
//
//  Created by 钟达烽 on 2022/12/27.
//

#import "AppDelegate.h"

#import "demo/DemoGradientController.h"
#import "demo/DemoBorderController.h"
#import "demo/DemoCornerController.h"
#import "demo/DemoShadowController.h"
#import "demo/DemoMixedController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.创建根控制器
//    DemoController *launchController = [[DemoController alloc]init];
    
//    DemoBorderController *launchController = [[DemoBorderController alloc]init];
//      DemoGradientController *launchController = [[DemoGradientController alloc]init];
//    DemoCornerController *launchController = [[DemoCornerController alloc]init];
//    DemoShadowController *launchController = [[DemoShadowController alloc]init];
    DemoMixedController *launchController = [[DemoMixedController alloc]init];

    
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
