//
//  AppDelegate.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginController.h"
#import "NavController.h"

#import "MessageController.h"
#import "DiscoverController.h"
#import "HomeController.h"
#import "SetController.h"
#import "FriendController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //UINavigationController *nav = [[NavController alloc] init];
    //self.window.rootViewController = nav;
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置TabBar背景图片
    //UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //[tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bar"]];
    
    _userDefaults = [NSUserDefaults standardUserDefaults];
    //BOOL islogin = [_userDefaults boolForKey:@"ISLOGIN"];
    
    BOOL islogin = true;
    
    if(islogin){
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        HpBarController *hpBar = [[HpBarController alloc]init];
        //UINavigationController *nav = [[NavController alloc] init];
        //self.window.rootViewController = hpBar;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:hpBar];
        _window.rootViewController = nav;
        //[_window makeKeyAndVisible];

        
        //NavController *nav = [[NavController alloc] init];
        //UIViewController *hpBar = [[HpBarController alloc]init];
        //UINavigationController *nav = [[NavController alloc] init];
        //self.window.rootViewController = hpBar;
        //MessageController *msg = [[MessageController alloc] init];
        //DiscoverController *dis = [[DiscoverController alloc] init];
        //HomeController *home = [[HomeController alloc] init];
        //SetController *set = [[SetController alloc] init];
        //FriendController *friend = [[FriendController alloc] init];
        
        //[nav setViewControllers:@[msg,dis,home,set,friend,hpBar]];
        
    }else{
        LoginController *login = [[LoginController alloc] init];
        self.window.rootViewController = login;
    
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
