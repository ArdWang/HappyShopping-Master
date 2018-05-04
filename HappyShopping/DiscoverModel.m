//
//  DiscoverModel.m
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "DiscoverModel.h"

@implementation DiscoverModel

-(instancetype)init{
    self = [super init];
    if(self){
    }
    return self;
}

//传入的是个数和 页数
-(void)loadNumber:(int) number loadPage:(int) page{
    NSString *strUrl = GANK_URL;
    NSString *totalUrl = [NSString stringWithFormat:strUrl,number,page];
    
    NSString *utf = [totalUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:utf parameters:nil progress:nil success:^(NSURLSessionDataTask *  _Nonnull task,  id  _Nullable responseObject) {
        NSLog(@"success--%@--%@",[responseObject class],responseObject);
        
        _discover = [DiscoverBean mj_objectWithKeyValues:responseObject];
        
        //_discover = [DiscoverBean mj_objectClassInArray:_discover];
        
        //_discovers = [DiscoverBean mj_objectClassInArray];
        
        //成功
        if([_discover.results count]>0){
            if([_delegate respondsToSelector:@selector(discoverSuccess:list:)]){
                [_delegate discoverSuccess:SUCCESS list:_discover.results];
            }
        }else{
            //失败
            if([_delegate respondsToSelector:@selector(discoverFail:message:)]){
                [_delegate discoverFail:FAIL message:LOGINFAILMESSAGE];
            }
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
        if([_delegate respondsToSelector:@selector(discoverError:message:)]){
            [_delegate discoverError:ERROR message:error.localizedDescription];
        }
    }];
    
}


@end
