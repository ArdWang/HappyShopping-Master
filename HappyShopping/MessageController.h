//
//  MessageController.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageCell.h"
#import "MessageModel.h"
#import "MessageView.h"

@interface MessageController : UIViewController

@property(strong,nonatomic) MessageView *msgView;

@property(strong,nonatomic) MessageModel *msgModel;

@property(strong,nonatomic) MessageCell *msgCell;

@property(nonatomic,strong) NSString *message;

@property(nonatomic,assign) int code;

@property(nonatomic,strong) NSMutableArray *msgList;

@property(nonatomic,strong) NSArray *msglist;

@property(nonatomic,strong) Result *msgBean;

@end
