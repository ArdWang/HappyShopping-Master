//
//  ChartModel.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"
#import "AFNetworking.h"
#import "ChartBeans.h"
#import "Chart.h"
#import "MJExtension.h"


// 新建一个协议，协议的名字一般是由“类名+Delegate”
@protocol ChartModelDelegate <NSObject>

//成功的时候
- (void)chartSuccess:(int) code chart:(NSString*) chart;
//错误的时候
- (void)chartError:(int) code message:(NSString *)message;
//失败的时候
- (void)chartFail:(int) code message:(NSString *)message;

@end

@interface ChartModel : NSObject

@property(assign,nonatomic) id<ChartModelDelegate> delegate;

@property(strong,nonatomic) Chart *chart;

-(void)loadChart:(NSString*)chart;

@end
