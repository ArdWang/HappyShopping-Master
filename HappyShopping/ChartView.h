//
//  ChartView.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalUtil.h"

//设置代理方法
@protocol ChartViewDelegate <NSObject>

- (void)onBackClick;

- (void)onBtnClick;

@end

@interface ChartView : UIView

@property(assign,nonatomic) id<ChartViewDelegate> delegate;


@property(strong,nonatomic) NormalUtil *normalUtil;

//tableView显示
@property(strong,nonatomic) UITableView *chartTable;

//发送消息框
@property(strong,nonatomic) UIButton *chartBtn;

//输入文字框
@property(strong,nonatomic) UITextField *txtField;

@end
