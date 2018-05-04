//
//  SetView.h
//  HappyShopping
//
//  Created by rnd on 2017/9/5.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SetViewDelegate <NSObject>

-(void)orderOnClick;

-(void)purseOnClick;

-(void)creditOnClick;

-(void)aboutMeOnClick;

-(void)editionOnClick;

-(void)functionOnClick;


@end



@interface SetView : UIView

@property(assign,nonatomic) id<SetViewDelegate> delegate;

//头像
@property(strong,nonatomic) UIImageView *headImageView;

@property(strong,nonatomic) UILabel *headName;

@property(strong,nonatomic) UILabel *headCon;

//底部
@property(strong,nonatomic) UIButton *btnOrder;

@property(strong,nonatomic) UIButton *btnPurse;

@property(strong,nonatomic) UIButton *btnCredit;

@property(strong,nonatomic) UIButton *btnAboutMe;

@property(strong,nonatomic) UIButton *btnEdition;

@property(strong,nonatomic) UIButton *btnFunction;

@property(strong,nonatomic) UIButton *btnSet;

@end
