//
//  HomeController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "HomeController.h"
#import "IanScrollView.h"

#ifdef __OBJC__

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#endif

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //_homeView = [HomeView new];
    //[self loadData];
    //_homeView.frame = self.view.bounds;
    //[self.view addSubview:_homeView];
    [self initView];
    
}

-(void)initView{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    _mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.contentSize = CGSizeMake(size.width, 1200);
    _mainScrollView.scrollEnabled = YES;
    _mainScrollView.directionalLockEnabled = YES;
    _mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainScrollView];
    
    [_mainScrollView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    IanScrollView *scrollView = [[IanScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 130)];
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 1; i < 7; i ++) {
        [array addObject:[NSString stringWithFormat:@"http://childmusic.qiniudn.com/huandeng/%ld.png", (long)i]];
    }
    scrollView.slideImagesArray = array;
    scrollView.ianEcrollViewSelectAction = ^(NSInteger i){
        NSLog(@"点击了%ld张图片",(long)i);
    };
    
    scrollView.ianCurrentIndex = ^(NSInteger index){
        NSLog(@"测试一下：%ld",(long)index);
    };
    
    scrollView.PageControlPageIndicatorTintColor = [UIColor colorWithRed:255/255.0f green:244/255.0f blue:227/255.0f alpha:1];
    scrollView.pageControlCurrentPageIndicatorTintColor = [UIColor colorWithRed:67/255.0f green:174/255.0f blue:168/255.0f alpha:1];
    scrollView.autoTime = [NSNumber numberWithFloat:4.0f];
    NSLog(@"%@",scrollView.slideImagesArray);
    [scrollView startLoading];
    [_mainScrollView addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
