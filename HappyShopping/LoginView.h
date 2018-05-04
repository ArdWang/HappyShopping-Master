//
//  LoginView.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

//设置代理方法
@protocol LoginViewDelegate <NSObject>

- (void)onBtnLoginClick;

@end


@interface LoginView : UIView

//设置代理
@property (nonatomic, weak) id<LoginViewDelegate> delegate;

//用户名
@property(strong,nonatomic) UILabel *usernameLabel;
@property(strong,nonatomic) UITextField *usernameText;
@property(strong,nonatomic) UIImageView *usernameImage;

//密码
@property(strong,nonatomic)UILabel *passwordLabel;
@property(strong,nonatomic)UITextField *passwordText;
@property(strong,nonatomic)UIImageView *passwordImage;

//按钮
@property(strong,nonatomic) UIButton *btnSure;

@property(strong,nonatomic) UIButton *btnFpassword;

@property(strong,nonatomic) UIButton *btnRegister;

@property(nonatomic)BOOL isselect;

@property(nonatomic) NSInteger selectedIndex;

@property(strong,nonatomic)NSUserDefaults *userDefaults;

@end
