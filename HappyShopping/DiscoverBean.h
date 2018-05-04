//
//  DiscoverBean.h
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "Discover.h"

@interface DiscoverBean : NSObject

@property (nonatomic, strong) NSString *error;

@property (nonatomic, strong) NSArray *results;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

- (id)valueForUndefinedKey:(NSString *)key;

+(NSDictionary*)mj_objectClassInArray;

@end
