//
//  FriendCell.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "FriendCell.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif

@implementation FriendCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//布局
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //布局
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        //图片显示
        UIImage *img = [UIImage imageNamed:@"head"];
        
        _displayImg = [[UIImageView alloc] init];
        _displayImg.layer.cornerRadius = 25.0f;
        _displayImg.layer.borderWidth = 1.0f;
        _displayImg.clipsToBounds = YES;
        
        [_displayImg setImage:img];
        [self.contentView addSubview:_displayImg];
        
        [_displayImg makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(15);
            make.left.equalTo(self.contentView).offset(20);
            make.width.equalTo(@50);
            make.height.equalTo(@50);
        }];
        
        //标题显示
        _txtTitle = [[UILabel alloc] init];
        _txtTitle.textColor = [UIColor blackColor];
        _txtTitle.font = [UIFont fontWithName:@"Helvetica" size:14];
        NSString *name = @"None";
        _txtTitle.text = name;
        [self.contentView addSubview:_txtTitle];
        
        [_txtTitle makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(self.contentView).offset(80);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@25);
        }];
        
        //内容显示
        _txtCon = [[UILabel alloc] init];
        _txtCon.textColor = [UIColor blackColor];
        _txtCon.font = [UIFont fontWithName:@"Helvetica" size:14];
        NSString *con = @"None";
        _txtCon.text = con;
        [self.contentView addSubview:_txtCon];
        
        [_txtCon makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_txtTitle).offset(25);
            make.left.equalTo(self.contentView).offset(80);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@25);
        }];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
