//
//  DiscoverController.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverModel.h"
#import "DisvocerMd.h"
#import "DiscoverCell.h"
#import "MGWaterflowLayout.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "MGShopModel.h"
#import "MHProgress.h"
#import "DiscoverView.h"
#import "ImageMaxUtil.h"

@interface DiscoverController : UIViewController

@property(strong,nonatomic) DiscoverModel *discoverModel;

/**
 *  源数据
 */
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataList;

@property (nonatomic, assign) int page;

@property(nonatomic,strong) Discover *discover;

@property(nonatomic,strong) DiscoverView *discoverView;

@property(nonatomic,strong)NSArray* heightArr;

@property (nonatomic, assign) CGFloat w;

@property (nonatomic, assign) CGFloat h;

@property (nonatomic,strong) DiscoverCell *dscell;

@property (nonatomic,strong) UIImageView *img;
@end
