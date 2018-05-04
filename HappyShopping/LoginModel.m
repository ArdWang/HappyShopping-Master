//
//  LoginModel.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

-(instancetype)init{
    self = [super init];
    if(self){
        _listUser = [[NSArray alloc] init];
    }
    return self;
}

/*
 *  登录的方法
 */
-(void)Loginusername:(NSString *)username Loginpassword:(NSString *) password{
    //首先判断不能为空
    if(![username isEqual:@""]&&username!=nil&&username!=NULL&&![password isEqual:@""]&&password!=nil&&password!=NULL){
        
        //NSString *strURL = BASE_URL;
        
        NSString *strURL = USER_URL;
        
        NSDictionary *dict = @{
                               @"action":@"login",
                               @"username":username,
                               @"password":password
                               };
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:strURL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"success--%@--%@",[responseObject class],responseObject);
            
            _user = [UserBean modelObjectWithDictionary:responseObject];
            //成功
            if(_user.code==200&&[_user.user count]>0){
                if([_delegate respondsToSelector:@selector(loginSuccess:listUser:)]){
                    [_delegate loginSuccess:SUCCESS listUser:_user.user];
                }
            }else{
                //失败
                if([_delegate respondsToSelector:@selector(loginFail:message:)]){
                    [_delegate loginFail:FAIL message:LOGINFAILMESSAGE];
                }
            }
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            //打印错误
            NSLog(@"failure--%@",error.localizedDescription);
            if([_delegate respondsToSelector:@selector(loginError:message:)]){
                [_delegate loginError:ERROR message:error.localizedDescription];
            }
        }];
    }else{
        if([_delegate respondsToSelector:@selector(inputnull:message:)]){
            [_delegate inputnull:INPUTNULL message:INPUTNULLMESSAGE];
        }
    }
}


@end
