//
//  Discover.m
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//
/*
 @property(nonatomic,strong) NSString *_id;
 @property(nonatomic,strong) NSString *createdAt;
 @property(nonatomic,strong) NSString *desc;
 @property(nonatomic,strong) NSString *publishedAt;
 @property(nonatomic,strong) NSString *chrome;
 @property(nonatomic,strong) NSString *type;
 @property(nonatomic,strong) NSString *url;
 @property(nonatomic,strong) NSString *used;
 @property(nonatomic,strong) NSString *who;
 */
#import "Discover.h"

@implementation Discover

-(id)initWithDict:(NSDictionary*)dict{
    if(self = [super init]){
        self._id = dict[@"_id"];
        self.createdAt = dict[@"createdAt"];
        self.desc = dict[@"desc"];
        self.publishedAt = dict[@"publishedAt"];
        self.chrome = dict[@"chrome"];
        self.type = dict[@"type"];
        self.url = dict[@"url"];
        self.used = dict[@"used"];
        self.who = dict[@"who"];
    }
    return self;
}


@end
