//
//  ChartCell.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "ChartCell.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif


@implementation ChartCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//在这里布局
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _headImageView = [[UIImageView alloc] init];
        _headImageView.layer.cornerRadius = 25.0f;
        _headImageView.layer.borderWidth = 1.0f;
        _headImageView.clipsToBounds = YES;
        [self.contentView addSubview:_headImageView];
        
        
        self.backView = [[UIImageView alloc] init];
        [self.contentView addSubview:_backView];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:17.0f];
        [self.backView addSubview:_contentLabel];
        
        //[_contentLabel makeConstraints:^(MASConstraintMaker *make){
            //make.top.equalTo(_backView).offset(5);
            //make.left.equalTo(_backView).offset(5);
            //make.right.equalTo(_backView).offset(-5);
            //make.bottom.equalTo(_backView).offset(-5);
        //}];
    }
    
    
    return self;
}

- (void)refreshCell:(ChartBeans *)model{
    // 气泡
    //UIImage *image = nil;
    // 头像
    //UIImage *headImage = nil;
    
    //计算布局 如果是在左边 显示左边头像和图片
    /*if(!model.isRight){
        image = [UIImage imageNamed:@"bubbleSomeone"];
        headImage = [UIImage imageNamed:@"head.JPG"];
        //顶部头像布局
        [_headImageView makeConstraints:^(MASConstraintMaker *make){
            make.width.equalTo(@50);
            make.height.equalTo(@50);
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(self.contentView).offset(10);
        }];
 
        //气泡布局
        [_backView makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(_backView.height);
            make.left.equalTo(_headImageView).offset(10);
        }];
    }else{
        //显示右边
        image = [UIImage imageNamed:@"bubbleMine"];
        headImage = [UIImage imageNamed:@"naruto@3x"];
        
        //顶部头像布局
        [_headImageView makeConstraints:^(MASConstraintMaker *make){
            make.width.equalTo(@50);
            make.height.equalTo(@50);
            make.top.equalTo(self.contentView).offset(_backView.height);
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        //气泡布局
        [_backView makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(_headImageView).offset(10);
        }];
        

    }*/
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    //CGFloat height = size.height;
    // 首先计算文本宽度和高度
    CGRect rec = [model.msg boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    // 气泡
    UIImage *image = nil;
    // 头像
    UIImage *headImage = nil;
    // 模拟左边
    if (!model.isRight)
    {
        // 当输入只有一个行的时候高度就是20多一点
        self.headImageView.frame = CGRectMake(10, rec.size.height - 18, 50, 50);
        self.backView.frame = CGRectMake(64, 10, rec.size.width + 20, rec.size.height + 20);
        image = [UIImage imageNamed:@"bubbleSomeone"];
        headImage = [UIImage imageNamed:@"head"];
    }
    else // 模拟右边
    {
        self.headImageView.frame = CGRectMake(width - 64, rec.size.height - 18, 50, 50);
        self.backView.frame = CGRectMake(width - 64 - rec.size.width - 20, 10, rec.size.width + 20, rec.size.height + 20);
        image = [UIImage imageNamed:@"bubbleMine"];
        headImage = [UIImage imageNamed:@"naruto"];
        //        image.leftCapWidth
    }
    // 拉伸图片 参数1 代表从左侧到指定像素禁止拉伸，该像素之后拉伸，参数2 代表从上面到指定像素禁止拉伸，该像素以下就拉伸
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    self.backView.image = image;
    self.headImageView.image = headImage;
    // 文本内容的frame
    self.contentLabel.frame = CGRectMake(model.isRight ? 5 : 13, 5, rec.size.width, rec.size.height);
    self.contentLabel.text = model.msg;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}




@end
