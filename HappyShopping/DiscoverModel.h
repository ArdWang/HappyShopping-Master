//
//  DiscoverModel.h
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"
#import "AFNetworking.h"
#import "DisvocerMd.h"
#import "MJExtension.h"

// 新建一个协议，协议的名字一般是由“类名+Delegate”
@protocol DiscoverModelDelegate <NSObject>

//成功的时候
- (void)discoverSuccess:(int) code list:(NSArray*) list;
//错误的时候
- (void)discoverError:(int) code message:(NSString *)message;
//失败的时候
- (void)discoverFail:(int) code message:(NSString *)message;

@end

@interface DiscoverModel : NSObject

@property(assign,nonatomic) id<DiscoverModelDelegate> delegate;

@property(strong,nonatomic) DiscoverBean *discover;

@property(strong,nonatomic) Discover *discovers;

//用到外部去的方法
-(void)loadNumber:(int) number loadPage:(int) page;

@end
