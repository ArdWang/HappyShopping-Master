//
//  MessageCell.h
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

//图片显示
@property(strong,nonatomic) UIImageView *displayImg;

@property(strong,nonatomic) UILabel *txtTitle;

@property(strong,nonatomic) UILabel *txtCon;

@property(strong,nonatomic) UILabel *isRed;

@end
