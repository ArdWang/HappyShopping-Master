//
//  Discover.h
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Discover : NSObject

/*
 "_id":"59a755a2421aa901c85e5fea",
 "createdAt":"2017-08-31T08:17:38.117Z",
 "desc":"8-31",
 "publishedAt":"2017-08-31T08:22:07.982Z",
 "source":"chrome",
 "type":"",
 "url":"https://ws1.sinaimg.cn/large/610dc034ly1fj2ld81qvoj20u00xm0y0.jpg",
 "used":true,
 "who":"daimajia"
 */

@property(nonatomic,strong) NSString *_id;
@property(nonatomic,strong) NSString *createdAt;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSString *publishedAt;
@property(nonatomic,strong) NSString *chrome;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *url;
@property(nonatomic,strong) NSString *used;
@property(nonatomic,strong) NSString *who;

-(id)initWithDict:(NSDictionary*)dict;

@end
