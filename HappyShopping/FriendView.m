//
//  FriendView.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "FriendView.h"
#import "NavController.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif

@implementation FriendView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self customNav];
        [self initView];
        [self createRerf];
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
        make.height.equalTo(@96);
    }];
}



-(void)initView{
    _friendTable = [[UITableView alloc] init];
    [self addSubview:_friendTable];
    //布局
    [_friendTable makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(64);
        make.bottom.equalTo(self).offset(-49);
    }];
}



//创建刷新的
-(void)createRerf{
    //创建头部下啦刷新
    _gifHeader = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadHeadData)];
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    [_gifHeader setImages:refreshingImages forState:MJRefreshStatePulling];
    _friendTable.mj_header = _gifHeader;
    
    //创建底部上啦刷新
    //_normalFooter = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreFooter)];
    //_bookView.mj_footer = _normalFooter;
    
}

//刷新头部的数据
-(void)loadHeadData{
    if(self.delegate){
        [self.delegate onLoadHead];
    }
}


@end
