//
//  LoginView.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "LoginView.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif


@implementation LoginView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        //添加布局
        [self initView];
        //添加按钮事件
        [self buttonOnclick];
    }
    
    return self;
}

//添加布局
-(void)initView{
    //添加主布局
    UIView *mainView = [[UIView alloc] init];
    mainView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"login_bg.png"]];
    
    mainView.alpha = 0.95;
    [self addSubview:mainView];
    
    //主view的约束
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(0);
        
    }];
    
    //中间显示的view
    UIView *middleView = [[UIView alloc] init];
    [mainView addSubview:middleView];
    
    //添加约束
    [middleView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(20);
        make.right.equalTo(mainView).offset(-20);
        make.top.equalTo(mainView).offset(170);
        make.height.equalTo(@170);
        
    }];
    
    //添加用户边框
    UIView *usernameView = [[UIView alloc] init];
    usernameView.layer.cornerRadius = 8;
    usernameView.layer.borderColor = [[UIColor whiteColor] CGColor];
    usernameView.layer.borderWidth = 1;
    [middleView addSubview:usernameView];
    
    [usernameView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(middleView).offset(10);
        make.right.equalTo(middleView).offset(-10);
        make.top.equalTo(middleView).offset(10);
        make.height.equalTo(@50);
    }];
    
    
    //添加文字框
    _usernameImage = [[UIImageView alloc] init];
    //_usernameLabel.text = @"用户名:";
    [_usernameImage setImage:[UIImage imageNamed:@"usernamex.png"]];
    //一定这么写居中 不然会报警告的
    //_usernameLabel.textAlignment = NSTextAlignmentCenter;
    //_usernameLabel.textColor = [UIColor whiteColor];
    [usernameView addSubview:_usernameImage];
    
    //添加约束
    [_usernameImage makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(usernameView).offset(10);
        make.width.equalTo(@25);
        make.top.equalTo(usernameView).offset(15);
        make.height.equalTo(@25);
    }];
    
    //添加输入框
    _usernameText = [[UITextField alloc] init];
    _usernameText.textColor = [UIColor whiteColor];
    [self addSubview:_usernameText];
    [_usernameText makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_usernameImage).offset(35);
        make.width.equalTo(@220);
        make.top.equalTo(usernameView).offset(0);
        make.height.equalTo(@50);
    }];
    
    //添加密码框view
    UIView *passwordView = [[UIView alloc] init];
    passwordView.layer.cornerRadius = 8;
    passwordView.layer.borderColor = [[UIColor whiteColor] CGColor];
    passwordView.layer.borderWidth = 1;
    [middleView addSubview:passwordView];
    
    [passwordView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(middleView).offset(10);
        make.right.equalTo(middleView).offset(-10);
        make.top.equalTo(usernameView).offset(85);
        make.height.equalTo(@50);
    }];
    
    //添加密码文字框
    _passwordImage = [[UIImageView alloc] init];
    //_passwordImage.textColor = [UIColor whiteColor];
    [_passwordImage setImage:[UIImage imageNamed:@"passwordx.png"]];
    //_passwordLabel.text = @"密码:";
    [passwordView addSubview:_passwordImage];
    [_passwordImage makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(passwordView).offset(10);
        make.width.equalTo(@25);
        make.top.equalTo(passwordView).offset(15);
        make.height.equalTo(@25);
    }];
    
    //添加密码框
    _passwordText = [[UITextField alloc] init];
    _passwordText.textColor = [UIColor whiteColor];
    [passwordView addSubview:_passwordText];
    [_passwordText makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_passwordImage).offset(35);
        make.width.equalTo(@220);
        make.top.equalTo(passwordView).offset(0);
        make.height.equalTo(@50);
    }];
    
    
    //确定按钮
    _btnSure = [[UIButton alloc] init];
    [_btnSure setTitle:@"登录" forState:UIControlStateNormal];
    _isselect = TRUE;
    if(_isselect){
        _btnSure.backgroundColor = [UIColor redColor];
    }

    _btnSure.layer.cornerRadius = 15;
    [mainView addSubview:_btnSure];
    [_btnSure makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(middleView).offset(180);
        make.left.equalTo(mainView).offset(30);
        make.right.equalTo(mainView).offset(-30);
        make.height.equalTo(@50);
    }];
    
    //忘记密码按钮
    _btnFpassword = [[UIButton alloc] init];
    [_btnFpassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    //_btnFpassword.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:_btnFpassword];
    
    [_btnFpassword makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_btnSure).offset(65);
        make.left.equalTo(mainView).offset(30);
        make.right.equalTo(mainView).offset(-30);
        make.height.equalTo(@55);
    }];
    
    //下面再增加一个主要的栏目
    UIView *bottomView = [[UIView alloc] init];
    [mainView addSubview:bottomView];
    [bottomView makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(mainView.bottom).offset(0);
        make.left.equalTo(mainView).offset(20);
        make.right.equalTo(mainView).offset(-20);
        make.height.equalTo(@80);
    }];
    
    UIView *b_topView = [[UIView alloc] init];
    b_topView.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:b_topView];
    [b_topView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(bottomView).offset(5);
        make.left.equalTo(bottomView).offset(0);
        make.right.equalTo(bottomView).offset(0);
        make.height.equalTo(@1);
    }];
    
    //注册账号
    _btnRegister = [[UIButton alloc] init];
    [_btnRegister setTitle:@"加入我们!" forState:UIControlStateNormal];
    [bottomView addSubview:_btnRegister];
    [_btnRegister makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(b_topView).offset(10);
        make.left.equalTo(bottomView).offset(5);
        make.right.equalTo(bottomView).offset(-5);
        make.height.equalTo(@55);
    }];
}

//按钮点击事件
-(void)buttonOnclick{
    [_btnSure addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //[_btnSure addTarget:self action:@selector(sureonClickU:) forControlEvents:UIControlEventTouchDown];
    
    //_btnFpassword addTarget:self action:@selector(fpasswordonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //[_btnRegister addTarget:self action:@selector(registeronClick:) forControlEvents:UIControlEventTouchUpInside];
}

//登录按钮代理
-(void)btnOnClick{
    if(self.delegate){
        [self.delegate onBtnLoginClick];
    }
}




@end
