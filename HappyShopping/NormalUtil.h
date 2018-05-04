//
//  NormalUtil.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NormalUtil : NSObject

//静态类
+(NormalUtil*)sharedManager;

//颜色转换
- (UIColor *) stringTOColor:(NSString *)str;

@end
