//
//  SetController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "SetController.h"
#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif


@interface SetController ()<SetViewDelegate>

@end

@implementation SetController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
    
}

//初始化控件
-(void)initView{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    _mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.contentSize = CGSizeMake(size.width, 500);
    _mainScrollView.scrollEnabled = YES;
    _mainScrollView.directionalLockEnabled = YES;
    _mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainScrollView];
    
    [_mainScrollView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    _setView = [SetView new];
    _setView.frame = self.view.bounds;
    //添加到Controller这里面去
    [_mainScrollView addSubview:_setView];
    
    _setView.delegate = self;
    
}

#pragma mark 按钮点击事件
-(void)orderOnClick{
    NSLog(@"orderoNclick");
}

-(void)purseOnClick{
    NSLog(@"purseOnClick");
}

-(void)creditOnClick{
    NSLog(@"creditOnClick");
}

-(void)aboutMeOnClick{
    NSLog(@"aboutMeOnClick");
}

-(void)editionOnClick{
    NSLog(@"editionOnClick");
}

-(void)functionOnClick{
    NSLog(@"functionOnClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
