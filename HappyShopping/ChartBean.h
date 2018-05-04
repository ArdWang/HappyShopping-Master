//
//  ChartBean.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChartBean : NSObject

//id
@property(nonatomic) int _id;

//聊天名称
@property(nonatomic,retain) NSString *chartname;

//介绍
@property(nonatomic,retain) NSString *chartjs;

//图片
@property(nonatomic,retain) NSString *chartimg;


@end
