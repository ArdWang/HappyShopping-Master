//
//  FriendController.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendView.h"
#import "FriendModel.h"
#import "FriendCell.h"
#import "ChartBean.h"
#import "ChartController.h"

@interface FriendController : UIViewController

@property(nonatomic,strong) FriendView *friendView;

@property(nonatomic,strong) FriendModel *friendModel;

@property(nonatomic,strong) FriendCell *friendCell;

@property(nonatomic,strong) NSMutableArray *chartList;

@property(nonatomic,strong) ChartBean *chartBean;

@end
