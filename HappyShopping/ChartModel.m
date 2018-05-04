//
//  ChartModel.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "ChartModel.h"


@implementation ChartModel

-(instancetype)init{
    self = [super init];
    if(self){
        //_listUser = [[NSArray alloc] init];
    }
    return self;
}

-(void)loadChart:(NSString*)chart{
    NSString *strURL = TURING_URL;
    NSString *apk = TURING_KEY;
    NSString *userid = USE_ID;
    
    NSDictionary *dict = @{
                           @"key":apk,
                           @"info":chart,
                           @"userid":userid
                           };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:strURL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success--%@--%@",[responseObject class],responseObject);
        
        _chart = [Chart mj_objectWithKeyValues:responseObject];
        //成功
        if([_chart.code isEqualToString:@"100000"]){
            if([_delegate respondsToSelector:@selector(chartSuccess:chart:)]){
                [_delegate chartSuccess:SUCCESS chart:_chart.text];
            }
        }else{
            //失败
            if([_delegate respondsToSelector:@selector(chartFail:message:)]){
                [_delegate chartFail:FAIL message:LOGINFAILMESSAGE];
            }
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
        if([_delegate respondsToSelector:@selector(chartError:message:)]){
            [_delegate chartError:ERROR message:error.localizedDescription];
        }
    }];
}

@end
