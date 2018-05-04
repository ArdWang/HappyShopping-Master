//
//  HpBarView.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "HpBarView.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif

@implementation HpBarView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        //创建自定义导航栏
        [self customNav];
    }
    
    return self;
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
    //UIBarButtonItem *button =[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftBtn)];
    
    //self.navigationItem.rightBarButtonItem = button;
    //添加到左边按钮
    //navItem.leftBarButtonItem = button;
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

@end
