//
//  MessageModel.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

//加载消息
-(void)loadMessage{
    
    NSString *strURL = TEST_URL;
    NSDictionary *dict = @{@"key":APPKEY};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:strURL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success--%@--%@",[responseObject class],responseObject);
        
        _msg = [MessageBean modelObjectWithDictionary:responseObject];
        //成功
        if([_msg.resultcode isEqual:@"200"]&&[_msg.result count]>0){
            if([_delegate respondsToSelector:@selector(msgSuccess:msgList:)]){
                [_delegate msgSuccess:SUCCESS msgList:_msg.result];
            }
        }else{
            //失败
            if([_delegate respondsToSelector:@selector(msgFail:message:)]){
                [_delegate msgFail:FAIL message:LOGINFAILMESSAGE];
            }
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
        if([_delegate respondsToSelector:@selector(msgError:message:)]){
            [_delegate msgError:ERROR message:error.localizedDescription];
        }
    }];
    
}



@end
