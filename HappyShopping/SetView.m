//
//  SetView.m
//  HappyShopping
//
//  Created by rnd on 2017/9/5.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "SetView.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif

@implementation SetView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
        [self createOnClick];
    }
    return self;
}

//创建布局
-(void)initView{
    UIView *headView = [[UIView alloc] init];
    headView.layer.cornerRadius = 8;
    headView.layer.borderColor = [[UIColor blueColor] CGColor];
    headView.layer.borderWidth = 0.5;
    [self addSubview:headView];
    
    //主view的约束
    [headView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
        make.height.equalTo(@80);
    }];
    
    //头部头像
    _headImageView = [[UIImageView alloc] init];
    [_headImageView setImage:[UIImage imageNamed:@"naruto"]];
    [headView addSubview:_headImageView];
    
    //添加约束
    [_headImageView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(headView).offset(10);
        make.width.equalTo(@50);
        make.top.equalTo(headView).offset(15);
        make.height.equalTo(@50);
    }];
    
    //头部文字
    _headName = [[UILabel alloc] init];
    _headName.textColor = [UIColor blackColor];
    _headName.font = [UIFont fontWithName:@"Helvetica" size:14];
    NSString *name = @"我的天空";
    _headName.text = name;
    [headView addSubview:_headName];
    
    [_headName makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(headView).offset(10);
        make.left.equalTo(headView).offset(80);
        make.right.equalTo(headView).offset(-10);
        make.height.equalTo(@25);
    }];
    
    //头部内容
    _headCon = [[UILabel alloc] init];
    _headCon.textColor = [UIColor blackColor];
    _headCon.font = [UIFont fontWithName:@"Helvetica" size:12];
    NSString *con = @"也许你一生中走错了不少路 看错不少人 承受了许多的背叛 落魄得狼狈不堪 但都无所谓 只要还活着 就总有希望 余生很长 何必慌张";
    _headCon.text = con;
    [headView addSubview:_headCon];
    
    [_headCon makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(headView).offset(45);
        make.left.equalTo(headView).offset(80);
        make.right.equalTo(headView).offset(-10);
        make.height.equalTo(@25);
    }];
    
    
    //下面的View
    UIView *bottomView = [[UIView alloc] init];
    bottomView.layer.cornerRadius = 8;
    bottomView.layer.borderColor = [[UIColor blueColor] CGColor];
    bottomView.layer.borderWidth = 0.5;
    [self addSubview:bottomView];
    
    //主view的约束
    [bottomView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(headView).offset(90);
        make.height.equalTo(@350);
    }];
    
    //***订单*** 大的区块
    _btnOrder = [[UIButton alloc] init];
    _btnOrder.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:_btnOrder];
    
    [_btnOrder makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(bottomView).offset(10);
        make.right.equalTo(bottomView).offset(-10);
        make.top.equalTo(bottomView).offset(5);
        make.height.equalTo(@55);
    }];
    
    //订单里面的文字
    UILabel *orderLabel = [[UILabel alloc] init];
    orderLabel.textColor = [UIColor blackColor];
    orderLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    NSString *order = @"订单";
    orderLabel.text = order;
    [_btnOrder addSubview:orderLabel];
    
    [orderLabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_btnOrder.centerY);
        //make.top.equalTo(_btnOrder).offset(10);
        make.left.equalTo(_btnOrder).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@25);
    }];
    
    //订单里面的图片
    UIImageView *orderImgView = [[UIImageView alloc] init];
    [orderImgView setImage:[UIImage imageNamed:@"right.jpg"]];
    [_btnOrder addSubview:orderImgView];
    
    //添加约束
    [orderImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_btnOrder).offset(-40);
        make.width.equalTo(@15);
        make.centerY.equalTo(_btnOrder.centerY);
        //make.top.equalTo(_btnOrder).offset(15);
        make.height.equalTo(@15);
    }];
    
    //添加下划线
    UIView *orderbmView = [[UIView alloc] init];
    orderbmView.backgroundColor = [UIColor blueColor];
    [bottomView addSubview:orderbmView];
    
    [orderbmView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_btnOrder).offset(2);
        make.right.equalTo(_btnOrder).offset(-2);
        make.top.equalTo(_btnOrder).offset(56);
        make.height.equalTo(@0.5);
    }];
    
    //***钱包*** 大的区块
    _btnPurse = [[UIButton alloc] init];
    _btnPurse.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:_btnPurse];
    
    [_btnPurse makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(bottomView).offset(10);
        make.right.equalTo(bottomView).offset(-10);
        make.top.equalTo(_btnOrder).offset(57);
        make.height.equalTo(@55);
    }];
    
   
    UILabel *purseLabel = [[UILabel alloc] init];
    purseLabel.textColor = [UIColor blackColor];
    purseLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    NSString *purse = @"钱包";
    purseLabel.text = purse;
    [_btnPurse addSubview:purseLabel];
    
    [purseLabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_btnPurse.centerY);
        make.left.equalTo(_btnPurse).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@25);
    }];
    
   
    UIImageView *purseImgView = [[UIImageView alloc] init];
    [purseImgView setImage:[UIImage imageNamed:@"right.jpg"]];
    [_btnPurse addSubview:purseImgView];
    
    //添加约束
    [purseImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_btnPurse).offset(-40);
        make.width.equalTo(@15);
        make.centerY.equalTo(_btnPurse.centerY);
        make.height.equalTo(@15);
    }];
    
    //添加下划线
    UIView *pursebmView = [[UIView alloc] init];
    pursebmView.backgroundColor = [UIColor blueColor];
    [_btnPurse addSubview:pursebmView];
    
    [pursebmView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_btnPurse).offset(2);
        make.right.equalTo(_btnPurse).offset(-2);
        make.top.equalTo(_btnPurse).offset(56);
        make.height.equalTo(@0.5);
    }];

    //***信誉度*** 大的区块
    _btnCredit = [[UIButton alloc] init];
    _btnCredit.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:_btnCredit];
    
    [_btnCredit makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(bottomView).offset(10);
        make.right.equalTo(bottomView).offset(-10);
        make.top.equalTo(_btnPurse).offset(57);
        make.height.equalTo(@55);
    }];
    
    UILabel *creditLabel = [[UILabel alloc] init];
    creditLabel.textColor = [UIColor blackColor];
    creditLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    NSString *credit = @"信誉度";
    creditLabel.text = credit;
    [_btnCredit addSubview:creditLabel];
    
    [creditLabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_btnCredit.centerY);
        make.left.equalTo(_btnCredit).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@25);
    }];
    
    
    UIImageView *creditImgView = [[UIImageView alloc] init];
    [creditImgView setImage:[UIImage imageNamed:@"right.jpg"]];
    [_btnCredit addSubview:creditImgView];
    
    //添加约束
    [creditImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_btnCredit).offset(-40);
        make.width.equalTo(@15);
        make.centerY.equalTo(_btnCredit.centerY);
        make.height.equalTo(@15);
    }];
    
    //添加下划线
    UIView *creditbmView = [[UIView alloc] init];
    creditbmView.backgroundColor = [UIColor blueColor];
    [_btnCredit addSubview:creditbmView];
    
    [creditbmView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_btnCredit).offset(2);
        make.right.equalTo(_btnCredit).offset(-2);
        make.top.equalTo(_btnCredit).offset(56);
        make.height.equalTo(@0.5);
    }];
    
    
    //***当前版本*** 大的区块
    _btnEdition = [[UIButton alloc] init];
    _btnEdition.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:_btnEdition];
    
    [_btnEdition makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(bottomView).offset(10);
        make.right.equalTo(bottomView).offset(-10);
        make.top.equalTo(_btnCredit).offset(57);
        make.height.equalTo(@55);
    }];
    
    UILabel *editionLabel = [[UILabel alloc] init];
    editionLabel.textColor = [UIColor blackColor];
    editionLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    NSString *edition = @"当前版本";
    editionLabel.text = edition;
    [_btnEdition addSubview:editionLabel];
    
    [editionLabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_btnEdition.centerY);
        make.left.equalTo(_btnEdition).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@25);
    }];
    
    
    UIImageView *editionImgView = [[UIImageView alloc] init];
    [editionImgView setImage:[UIImage imageNamed:@"right.jpg"]];
    [_btnEdition addSubview:editionImgView];
    
    //添加约束
    [editionImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_btnEdition).offset(-40);
        make.width.equalTo(@15);
        make.centerY.equalTo(_btnEdition.centerY);
        make.height.equalTo(@15);
    }];
    
    //添加下划线
    UIView *editionbmView = [[UIView alloc] init];
    editionbmView.backgroundColor = [UIColor blueColor];
    [_btnEdition addSubview:editionbmView];
    
    [editionbmView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_btnEdition).offset(2);
        make.right.equalTo(_btnEdition).offset(-2);
        make.top.equalTo(_btnEdition).offset(56);
        make.height.equalTo(@0.5);
    }];
    
    
    //***功能介绍*** 大的区块
    _btnFunction = [[UIButton alloc] init];
    _btnFunction.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:_btnFunction];
    
    [_btnFunction makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(bottomView).offset(10);
        make.right.equalTo(bottomView).offset(-10);
        make.top.equalTo(_btnEdition).offset(57);
        make.height.equalTo(@55);
    }];
    
    UILabel *functionLabel = [[UILabel alloc] init];
    functionLabel.textColor = [UIColor blackColor];
    functionLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    NSString *function = @"功能";
    functionLabel.text = function;
    [_btnFunction addSubview:functionLabel];
    
    [functionLabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_btnFunction.centerY);
        make.left.equalTo(_btnFunction).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@25);
    }];
    
    
    UIImageView *functionImgView = [[UIImageView alloc] init];
    [functionImgView setImage:[UIImage imageNamed:@"right.jpg"]];
    [_btnFunction addSubview:functionImgView];
    
    //添加约束
    [functionImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_btnFunction).offset(-40);
        make.width.equalTo(@15);
        make.centerY.equalTo(_btnFunction.centerY);
        make.height.equalTo(@15);
    }];
    
    //添加下划线
    UIView *functionbmView = [[UIView alloc] init];
    functionbmView.backgroundColor = [UIColor blueColor];
    [_btnFunction addSubview:functionbmView];
    
    [functionbmView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_btnFunction).offset(2);
        make.right.equalTo(_btnFunction).offset(-2);
        make.top.equalTo(_btnFunction).offset(56);
        make.height.equalTo(@0.5);
    }];

    
    //***关于我们*** 大的区块
    _btnAboutMe = [[UIButton alloc] init];
    _btnAboutMe.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:_btnAboutMe];
    
    [_btnAboutMe makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(bottomView).offset(10);
        make.right.equalTo(bottomView).offset(-10);
        make.top.equalTo(_btnFunction).offset(57);
        make.height.equalTo(@55);
    }];
    
    UILabel *aboutMeLabel = [[UILabel alloc] init];
    aboutMeLabel.textColor = [UIColor blackColor];
    aboutMeLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    NSString *aboutMe = @"关于我们";
    aboutMeLabel.text = aboutMe;
    [_btnAboutMe addSubview:aboutMeLabel];
    
    [aboutMeLabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_btnAboutMe.centerY);
        make.left.equalTo(_btnAboutMe).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@25);
    }];
    
    
    UIImageView *aboutMeImgView = [[UIImageView alloc] init];
    [aboutMeImgView setImage:[UIImage imageNamed:@"right.jpg"]];
    [_btnAboutMe addSubview:aboutMeImgView];
    
    //添加约束
    [aboutMeImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_btnAboutMe).offset(-40);
        make.width.equalTo(@15);
        make.centerY.equalTo(_btnAboutMe.centerY);
        make.height.equalTo(@15);
    }];
    
    //添加下划线
    /*UIView *aboutMebmView = [[UIView alloc] init];
    aboutMebmView.backgroundColor = [UIColor blueColor];
    [_btnAboutMe addSubview:aboutMebmView];
    
    [aboutMebmView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_btnAboutMe).offset(2);
        make.right.equalTo(_btnAboutMe).offset(-2);
        make.top.equalTo(_btnAboutMe).offset(56);
        make.height.equalTo(@0.5);
    }];*/

}

//添加按钮点击事件
-(void)createOnClick{
    [_btnOrder addTarget:self action:@selector(btnOrderOnClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnPurse addTarget:self action:@selector(btnPurseOnClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnCredit addTarget:self action:@selector(btnCreditOnClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnAboutMe addTarget:self action:@selector(btnAboutMeOnClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnEdition addTarget:self action:@selector(btnEditionOnClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnFunction addTarget:self action:@selector(btnbtnFunctionOnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnOrderOnClick{
    if(self.delegate){
        [self.delegate orderOnClick];
    }
}

-(void)btnPurseOnClick{
    if(self.delegate){
        [self.delegate purseOnClick];
    }
}

-(void)btnCreditOnClick{
    if(self.delegate){
        [self.delegate creditOnClick];
    }
}

-(void)btnAboutMeOnClick{
    if(self.delegate){
        [self.delegate aboutMeOnClick];
    }
}

-(void)btnEditionOnClick{
    if(self.delegate){
        [self.delegate editionOnClick];
    }
}

-(void)btnbtnFunctionOnClick{
    if(self.delegate){
        [self.delegate functionOnClick];
    }
}

@end
