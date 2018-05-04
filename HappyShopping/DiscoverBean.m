//
//  DiscoverBean.m
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "DiscoverBean.h"

@implementation DiscoverBean

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //NSLog(@"捕获到未定义的key %@",key);
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

+(NSDictionary*)mj_objectClassInArray{
    return @{@"discover":[Discover class],};
}


@end
