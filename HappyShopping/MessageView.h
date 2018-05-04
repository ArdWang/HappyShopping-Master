//
//  MessageView.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "NormalUtil.h"

@protocol MessageViewDelegate <NSObject>
//加载头部刷新
-(void)onLoadHead;

@end

@interface MessageView : UIView


@property(nonatomic,strong) NormalUtil *normalUtil;

//代理
@property(assign,nonatomic) id<MessageViewDelegate> delegate;

//消息Table
@property(nonatomic,strong) UITableView *messageTable;

//刷新控件
@property(strong,nonatomic) MJRefreshGifHeader *gifHeader;

@end
