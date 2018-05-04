//
//  MessageModel.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"
#import "AFNetworking.h"
#import "MessageMode.h"

@protocol MessageModelDelegate <NSObject>

//成功的时候
- (void)msgSuccess:(int) code msgList:(NSArray *)list;
//错误的时候
- (void)msgError:(int) code message:(NSString *)message;
//失败的时候
- (void)msgFail:(int) code message:(NSString *)message;

@end

@interface MessageModel : NSObject

@property(nonatomic,assign) id<MessageModelDelegate> delegate;

@property(strong,nonatomic) MessageBean *msg;

-(void)loadMessage;

@end
