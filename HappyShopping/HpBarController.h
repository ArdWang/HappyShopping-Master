//
//  HpBarController.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MessageController.h"
#import "DiscoverController.h"
#import "HomeController.h"
#import "SetController.h"
#import "FriendController.h"
#import "HpBarView.h"
#import "NormalUtil.h"


@interface HpBarController : UITabBarController

@property(nonatomic,strong) MessageController *message;

@property(nonatomic,strong) DiscoverController *discover;

@property(nonatomic,strong) HomeController *home;

@property(nonatomic,strong) SetController *set;

@property(nonatomic,strong) FriendController *friends;

@property(nonatomic,strong) HpBarView *hpView;

//工具类
@property(nonatomic,strong) NormalUtil *normalUtil;

@end
