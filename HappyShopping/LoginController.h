//
//  LoginController.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "LoginModel.h"
#import "LoginView.h"
#import "MHProgress.h"
#import "HpBarController.h"

@interface LoginController : UIViewController

@property(nonatomic,strong) NSString *message;

@property(nonatomic,assign) int code;

//定时器
@property(strong,nonatomic) NSTimer *timer;

@property(nonatomic,strong) LoginView *loginView;

@property(nonatomic,strong) LoginModel *loginModel;

//获取user
@property(nonatomic,strong) NSArray *listUser;

@property(nonatomic,strong) MHProgress *progress;

//存储状态
@property(strong,nonatomic)NSUserDefaults *userDefaults;

@end
