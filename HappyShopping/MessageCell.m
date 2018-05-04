//
//  MessageCell.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "MessageCell.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif


@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


//布局
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //布局
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        //图片显示
        UIImage *img = [UIImage imageNamed:@"cloud_download.png"];
        _displayImg = [[UIImageView alloc] init];
        [_displayImg setImage:img];
        [self.contentView addSubview:_displayImg];
        
        [_displayImg makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(15);
            make.left.equalTo(self.contentView).offset(20);
            make.width.equalTo(@40);
            make.height.equalTo(@40);
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
        
        //是否已读
        _isRed = [[UILabel alloc] init];
        _isRed.textColor = [UIColor blackColor];
        _isRed.font = [UIFont fontWithName:@"Helvetica" size:14];
        NSString *isred = @"未读";
        _isRed.text = isred;
        [self.contentView addSubview:_isRed];
        
        [_isRed makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(25);
            make.right.equalTo(self.contentView).offset(-20);
            make.width.equalTo(@60);
            make.height.equalTo(@25);
        }];

    }
    
    

    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
