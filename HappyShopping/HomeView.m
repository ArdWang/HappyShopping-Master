//
//  HomeView.m
//  HappyShopping
//
//  Created by rnd on 2017/8/31.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "HomeView.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif


@implementation HomeView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
        //[self createRerf];
    }
    
    return self;
}

//添加布局
-(void)initView{
    
}


@end
