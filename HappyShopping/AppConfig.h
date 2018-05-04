//
//  AppConfig.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#ifndef AppConfig
#define AppConfig
#endif

#define APP_NAME    @"HappyTeam"

//自己的接口
#define BASE_URL @"http://192.168.0.229:8080/HappyTeamService/JsonServlet"

//聚合数据
#define TEST_URL @"http://apis.juhe.cn/goodbook/catalog"
//聚合数据的key
#define APPKEY @"4fe94ad0f6e0b7ff9cd5bc4ea8f01e3b"

//图灵URL
#define TURING_URL @"http://www.tuling123.com/openapi/api"

//图灵KEY
#define TURING_KEY @"a88fb85edd564b68b8854ef9b18cfd2f"

//图灵userID
#define USE_ID @"123456789";

//干货的链接地址
#define GANK_URL @"http://gank.io/api/data/福利/%ld/%ld"

#define USER_URL @"http://webapplication320170915022205.chinacloudsites.cn/Service/rilservlet.ashx"

#define SUCCESS 0x01  //成功
#define ERROR 0x20 //错误
#define FAIL  0x12 //失败
#define INPUTNULL 0x05 // 输入为空
#define DIFFERENCE 0x02 // 两次密码不一致
#define LOGINFAILMESSAGE @"你的账号或者密码错误，请重新输入!"
#define INPUTNULLMESSAGE @"输入不能为空"
#define CREATEACCOUNTFAIL @"创建账号失败!"
#define DIFFERENCEMESSAGE @"两次输入的密码不一致!"
