//
//  ChartController.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartView.h"
#import "ChartCell.h"
#import "ChartModel.h"
#import "KeyboardToolBar.h"


@interface ChartController : UIViewController

@property(strong,nonatomic) ChartView *chartView;

@property(strong,nonatomic) ChartModel *chartModel;

@property (nonatomic,strong) NSMutableArray *dataSouce;

@end
