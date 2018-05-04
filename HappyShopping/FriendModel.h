//
//  FriendModel.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChartBean.h"

@protocol FriendModelDelegate <NSObject>

//成功的时候
- (void)friendList:(NSArray *)list;

@end


@interface FriendModel : NSObject

@property(assign,nonatomic) id<FriendModelDelegate> delegate;

@property(nonatomic,strong) ChartBean *chartBean;

@property(nonatomic,strong) NSMutableArray *chartList;

-(void)loadFriend;

@end
