//
//  ChartView.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "ChartView.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif


@implementation ChartView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self customNav];
        [self initView];
    }
    return self;
}


-(void)initView{
    _chartTable = [[UITableView alloc] init];
    
    _chartTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self addSubview:_chartTable];
    //布局
    [_chartTable makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(64);
        make.bottom.equalTo(self).offset(-59);
    }];
    
    UIView *mainView = [[UIView alloc] init];
    mainView.backgroundColor = [UIColor whiteColor];
    [self addSubview:mainView];
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self.bottom).offset(0);
        make.height.equalTo(@70);
    }];
    
    //添加密码框view
    UIView *inputView = [[UIView alloc] init];
    inputView.layer.cornerRadius = 8;
    inputView.layer.borderColor = [[UIColor grayColor] CGColor];
    inputView.layer.borderWidth = 1;
    [self addSubview:inputView];
    
    [inputView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(10);
        make.right.equalTo(mainView).offset(-110);
        make.bottom.equalTo(mainView.bottom).offset(-10);
        make.height.equalTo(@50);
    }];
    
    //创建文本框
    _txtField = [[UITextField alloc] init];
    _txtField.backgroundColor = [UIColor whiteColor];
    //_txtField.textColor = [UIColor whiteColor];
    _txtField.layer.borderWidth = 0;
    //_txtField.layer.borderColor = [[UIColor whiteColor] CGColor];
    //_txtField.borderStyle = UITextBorderStyleRoundedRect;
    //当输入框没有内容时，水印提示 提示内容为password
    //这里需要加判断和提示 分别为温度和华氏度显示的时候
    NSString *inputName = @"说点什么";
    _txtField.placeholder = inputName;
    [inputView addSubview:_txtField];
    
    [_txtField makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(inputView).offset(10);
        make.right.equalTo(inputView).offset(-10);
        make.top.equalTo(inputView).offset(5);
        make.bottom.equalTo(inputView).offset(-5);
    }];
    
    //确定按钮
    _chartBtn = [[UIButton alloc] init];
    
    _chartBtn.backgroundColor = [_normalUtil stringTOColor:@"#6495ED"];
    
    //_chartBtn.backgroundColor = [UIColor blueColor];
    [_chartBtn setTitle:@"发送" forState:UIControlStateNormal];
    _chartBtn.layer.cornerRadius = 15;
    [self addSubview:_chartBtn];
    
    [_chartBtn makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(@90);
        make.right.equalTo(mainView).offset(-10);
        make.bottom.equalTo(mainView.bottom).offset(-10);
        make.height.equalTo(@50);
    }];
    
    [_chartBtn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)customNav{
    _normalUtil = [NormalUtil sharedManager];
    UIColor *blue = [_normalUtil stringTOColor:@"#436EEE"];
    UIColor *white = [_normalUtil stringTOColor:@"#FFFFFF"];
    //创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    //修改按钮显示颜色
    [navBar setTintColor:white];
    //创建一个导航栏集合
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@""];
    //导航栏中间的标题
    [navItem setTitle:@"快乐购"];
    //创建导航栏按钮
    //UIBarButtonItem *button =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(leftBtn)];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                                          initWithTitle:@"返回"
                                          style:UIBarButtonItemStylePlain
                                          target:self
                                          action:@selector(leftBtn)];    //添加到左边按钮
    navItem.leftBarButtonItem = button;
    //把导航栏集合添加到导航栏中，设置动画关闭
    [navBar pushNavigationItem:navItem animated:NO];
    navBar.barTintColor = blue;
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:white}];
    //[navBar setTitleTextAttributes:[UIColor whiteColor]];
    //将标题栏中的内容全部添加到主视图当中
    [self addSubview:navBar];
    
    [navBar makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.height.equalTo(@64);
    }];
}


-(void)btnOnClick{
    if(self.delegate){
        [self.delegate onBtnClick];
    }
}

-(void)leftBtn{
    if(self.delegate){
        [self.delegate onBackClick];
    }
}


@end
