//
//  DiscoverController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "DiscoverController.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif

@interface DiscoverController ()<DiscoverModelDelegate,UICollectionViewDataSource,MGWaterflowLayoutDelegate,UICollectionViewDelegate>{
    
}

@end

@implementation DiscoverController

static NSString * identifer = @"CollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _discoverModel = [DiscoverModel new];
    
    //_discoverView = [DiscoverView new];
    
    //_discoverView.frame = self.view.bounds;
    
    //_discoverView.flowLayout.delegate = self;
    
    //_discoverView.collectionView.dataSource = self;
    
    _dataList = [[NSMutableArray alloc] init];
    
    _discoverModel.delegate = self;

    _page = 10;
    
    [_discoverModel loadNumber:10 loadPage:_page];
    
    _img = [[UIImageView alloc] init];
    
    [self setUpLayout];
    
    [self setupRefresh];
    
    // 第一次刷新手动调用
    [self.collectionView.mj_header beginRefreshing];
   
}

//成功的时候
- (void)discoverSuccess:(int) code list:(NSArray*) list{
    //强制转换
    NSMutableArray *alllist = ( NSMutableArray*)list;
    //for(int i=0;i<alllist.count;i++){
       // _discover = [alllist objectAtIndex:i];
        //[_dataList addObject:_discover];
        //NSLog(@"_DTAALIST IS %@",_dataList);
    //}
    _dataList = [alllist mutableCopy];
    
    [self.collectionView reloadData];
    
}
//错误的时候
- (void)discoverError:(int) code message:(NSString *)message{
    NSString *msg = message;
    MHProgress *p = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [p showTips:msg intInterval:2];
}

//失败的时候
- (void)discoverFail:(int) code message:(NSString *)message{
    NSString *msg = message;
    MHProgress *p = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [p showTips:msg intInterval:2];
}

/// 初始化collectionView
- (void)setUpLayout{
    // 创建布局
    MGWaterflowLayout *flowLayout = [[MGWaterflowLayout alloc] init];
    flowLayout.delegate = self;
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    
    
    //布局
    [collectionView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(64);
        make.bottom.equalTo(self.view).offset(10);
    }];

    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DiscoverCell class]) bundle:nil] forCellWithReuseIdentifier:identifer];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    // tableView 偏移20/64适配
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}

/// 刷新加载数据
- (void)setupRefresh{
    // 上拉刷新
    self.collectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [_dataList removeAllObjects];
            
            [_discoverModel loadNumber:_page loadPage:1];
            // 刷新数据
            [self.collectionView reloadData];
            
            [self.collectionView.mj_header endRefreshing];
        });
    }];
    
    // 下拉加载
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 刷新数据
            _page=_page+10; //加10个数据
            
            [_discoverModel loadNumber:_page loadPage:1];
            
            //让主线程休息一秒再执行
            [NSThread sleepForTimeInterval:1];
            [self.collectionView reloadData];
            [self.collectionView.mj_footer endRefreshing];
        });
    }];
    
    self.collectionView.mj_footer.hidden = YES;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    return 39;
    self.collectionView.mj_footer.hidden = _dataList.count == 0;
    return _dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _dscell = [collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    if(_dataList.count>0){
        _discover = [[Discover alloc] initWithDict:[_dataList objectAtIndex:indexPath.row]];
        [_dscell.imageView sd_setImageWithURL:[NSURL URLWithString:_discover.url] placeholderImage:[UIImage imageNamed:@"user_default"]];
        _dscell.autLabel.text = _discover.who;
    }
    return _dscell;
}


#pragma mark 选择点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(_dataList.count>0){
        _discover = [[Discover alloc] initWithDict:[_dataList objectAtIndex:indexPath.row]];
        [_img sd_setImageWithURL:[NSURL URLWithString:_discover.url] placeholderImage:[UIImage imageNamed:@"user_default"]];
        [ImageMaxUtil scanBigImageWithImageView:_img alpha:80];
    }
}

#pragma mark - <MGWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(MGWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth
{
    //float a = arc4random()%50+80;
    return 220;
}

- (CGFloat)rowMarginInWaterflowLayout:(MGWaterflowLayout *)waterflowLayout
{
    return 20;
}

- (CGFloat)columnCountInWaterflowLayout:(MGWaterflowLayout *)waterflowLayout
{
    //if (_dataList.count <= 50) return 2;
    return 2;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(MGWaterflowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
