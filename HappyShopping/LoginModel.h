//
//  LoginModel.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "AppConfig.h"
#import "AFNetworking.h"

// 新建一个协议，协议的名字一般是由“类名+Delegate”
@protocol LoginModelDelegate <NSObject>

//成功的时候
- (void)loginSuccess:(int) code listUser:(NSArray*) array;
//错误的时候
- (void)loginError:(int) code message:(NSString *)message;
//失败的时候
- (void)loginFail:(int) code message:(NSString *)message;
//输入为空的时候
- (void)inputnull:(int) code message:(NSString *)message;

@end

@interface LoginModel : NSObject

@property(weak,nonatomic) id<LoginModelDelegate> delegate;

@property(nonatomic,strong) NSArray *listUser;

@property(nonatomic,strong) UserBean *user;

//获取消息信息
@property(nonatomic,strong) NSString *message;

//获取登录的接口
-(void)Loginusername:(NSString *)username Loginpassword:(NSString *) password;

@end
