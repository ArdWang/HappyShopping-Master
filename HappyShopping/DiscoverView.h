//
//  DiscoverView.h
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGWaterflowLayout.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif

@interface DiscoverView : UIView

@property(nonatomic,strong) UICollectionView *collectionView;

@property(nonatomic,strong) MGWaterflowLayout *flowLayout;


@end
