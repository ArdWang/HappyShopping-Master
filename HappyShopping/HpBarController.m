//
//  HpBarController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "HpBarController.h"
#import "DiscoverController.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif


@interface HpBarController ()

@end

@implementation HpBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self customNav];
    
    [self stepAllChildViewController];
    
    [self stepAllTitleButton];

}

-(void)customNav{
    _normalUtil = [NormalUtil sharedManager];
    UIColor *blues = [_normalUtil stringTOColor:@"#436EEE"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    [self.navigationController.navigationBar setBarTintColor:blues];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.title = @"HappyShopping";
    //[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    //NSString *back = NSLocalizedString(@"back", nil);
    
    //UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:back style:UIBarButtonItemStylePlain target:nil action:nil];
    //self.navigationItem.backBarButtonItem = item;
    //UIBarButtonItem *set = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"config"] style:UIBarButtonItemStylePlain target:self action:@selector(setOnClick)];
   // self.navigationItem.rightBarButtonItem = set;
}


#pragma mark 设置TabBar按钮上面的所有内容
-(void)stepAllChildViewController{
    //消息
    _message = [[MessageController alloc] init];
    UINavigationController *msgnav = [[UINavigationController alloc] initWithRootViewController:_message];
    [self addChildViewController:msgnav];

    //朋友
    _friends = [[FriendController alloc] init];
    UINavigationController *friendnav = [[UINavigationController alloc] initWithRootViewController:_friends];
    [self addChildViewController:friendnav];
    
    //主页
    _home = [[HomeController alloc] init];
    UINavigationController *homenav = [[UINavigationController alloc] initWithRootViewController:_home];
    [self addChildViewController:homenav];
    
    //发现
    _discover = [[DiscoverController alloc] init];
    UINavigationController *discovernav = [[UINavigationController alloc] initWithRootViewController:_discover];
    [self addChildViewController:discovernav];
    
    //设置
    _set = [[SetController alloc] init];
    UINavigationController *setnav = [[UINavigationController alloc] initWithRootViewController:_set];
    [self addChildViewController:setnav];
}


-(void)stepAllTitleButton{
    //设置TabBar背景图片
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    [UITabBar appearance].translucent = NO;
    
    //去掉顶部阴影部分
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //[[UITabBar appearance] setBarTintColor:[UIColor redColor]];
    //[UITabBar appearance].translucent = NO;
    
    //消息
    UINavigationController *msgnav = self.childViewControllers[0];
    msgnav.tabBarItem.title = @"消息";
    msgnav.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    msgnav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    
    //朋友
    UINavigationController *friendnav = self.childViewControllers[1];
    friendnav.tabBarItem.title = @"好友";
    friendnav.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendnav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    
    //主页
    UINavigationController *homenav = self.childViewControllers[2];
    homenav.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_click_icon"];
    homenav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_publish_icon"];
    [homenav.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homenav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    //发现
    UINavigationController *studynav = self.childViewControllers[3];
    studynav.tabBarItem.title = @"发现";
    studynav.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    studynav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    
    //设置
    UINavigationController *setnav = self.childViewControllers[4];
    setnav.tabBarItem.title = @"设置";
    setnav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    setnav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

/*- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
