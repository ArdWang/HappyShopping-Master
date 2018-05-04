//
//  FriendModel.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        _chartBean = [ChartBean new];
        _chartList = [[NSMutableArray alloc] init];
    }
    
    return self;
}


//加载数据
-(void)loadFriend{
    _chartBean._id = 1;
    _chartBean.chartname = @"聊天机器人";
    _chartBean.chartjs = @"谁来和我聊天呀";
    _chartBean.chartimg = @"head";
    
    [_chartList addObject:_chartBean];
    //判断相等的时候
    if([_delegate respondsToSelector:@selector(friendList:)]){
        [_delegate friendList:_chartList];
    }
}


@end
