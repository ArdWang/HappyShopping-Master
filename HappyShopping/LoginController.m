//
//  LoginController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//   

#import "LoginController.h"

@interface LoginController ()<LoginViewDelegate,LoginModelDelegate,UITextFieldDelegate>
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景颜色为白色
    self.view.backgroundColor = [UIColor whiteColor];
    
    _userDefaults = [NSUserDefaults standardUserDefaults];
    
    _loginView = [LoginView new];
    _loginModel = [LoginModel new];
    
    _loginView.frame = self.view.bounds;
    //添加到Controller这里面去
    [self.view addSubview:_loginView];
    
    _loginView.delegate = self;
    _loginModel.delegate = self;
    _loginView.usernameText.delegate = self;
    _loginView.passwordText.delegate = self;
}

#pragma mark 所有的代理
- (void)onBtnLoginClick{
    _progress = [[MHProgress alloc]
                     initWithType:MHPopViewTypeWrapContentWithTips
                     failedBlock:^(){
                         //[self AlertTips:@"网络错误!"];
                         //存储状态为真
                         //[_userDefaults setBool:TRUE forKey:@"ISLOGIN"];
                         //进入的关键代码
                         //UIApplication.sharedApplication.delegate.window.rootViewController = HpBarController.new;
                     }];
    [_progress showLoadingView];
    
    [_loginModel Loginusername:_loginView.usernameText.text Loginpassword:_loginView.passwordText.text];
}

//成功的时候
- (void)loginSuccess:(int) code listUser:(NSArray*) array{
    _code = code;
    _listUser = [array mutableCopy];
    
    //存储状态为真
    //[_userDefaults setBool:TRUE forKey:@"ISLOGIN"];
    //进入的关键代码
    //UIApplication.sharedApplication.delegate.window.rootViewController = HpBarController.new;
}

//错误的时候
- (void)loginError:(int) code message:(NSString *)message{
    _code = code;
    _message = message;
    [self AlertTips:_message];
}

//失败的时候
- (void)loginFail:(int) code message:(NSString *)message{
    _code = code;
    _message = message;
    [self AlertTips:_message];
}

//输入为空的时候
- (void)inputnull:(int) code message:(NSString *)message{
    _code = code;
    _message = message;
    [self AlertTips:_message];
}

//弹出来一个对话框
-(void)AlertTips:(NSString *) message{
    [_progress closeLoadingView]; // 关闭
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _message = @"";
        _code = 0;
    }];
    [alertController addAction:yesAction];
    [self presentViewController:alertController animated:true completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_loginView.usernameText resignFirstResponder];
    [_loginView.passwordText resignFirstResponder];
    
    return YES;
}

//点击空白处让键盘隐藏起来
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_loginView.usernameText resignFirstResponder];
    [_loginView.passwordText resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
