//
//  DiscoverView.m
//  HappyShopping
//
//  Created by rnd on 2017/9/1.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "DiscoverView.h"

@implementation DiscoverView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    
    return self;
}

-(void)initView{
    UIView *mainView = [[UIView alloc] init];
    [self addSubview:mainView];
    //布局
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(-49);
    }];
    
    _flowLayout = [[MGWaterflowLayout alloc] init];
    //_flowLayout.delegate = self;
    
    // 创建CollectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    //collectionView.dataSource = self;
    [mainView addSubview:_collectionView];
}

@end
