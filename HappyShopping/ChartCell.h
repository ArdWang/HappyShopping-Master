//
//  ChartCell.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartBeans.h"

@interface ChartCell : UITableViewCell

@property (nonatomic,strong) UIImageView *headImageView; // 用户头像

@property (nonatomic,strong) UIImageView *backView; // 气泡

@property (nonatomic,strong) UILabel *contentLabel; // 气泡内文本

- (void)refreshCell:(ChartBeans *)model; // 安装我们的cell

@end
