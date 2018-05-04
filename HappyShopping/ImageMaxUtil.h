//
//  ImageMaxUtil.h
//  HappyShopping
//
//  Created by rnd on 2017/11/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageMaxUtil : NSObject

/**
 *  浏览大图
 *
 *  @param currentImageview 当前图片
 *  @param alpha            背景透明度
 */
+(void)scanBigImageWithImageView:(UIImageView *)currentImageview alpha:(CGFloat)alpha;

@end
