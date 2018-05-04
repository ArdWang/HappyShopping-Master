//
//  FriendController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "FriendController.h"


@interface FriendController ()<FriendViewDelegate,FriendModelDelegate,UITableViewDataSource, UITableViewDelegate>

@end

@implementation FriendController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _friendModel = [FriendModel new];
    _friendView = [FriendView new];
    _chartBean = [ChartBean new];
    _chartList = [[NSMutableArray alloc] init];
    _friendView.frame = self.view.bounds;
    [self.view addSubview:_friendView];
    
    _friendModel.delegate = self;
    _friendView.delegate = self;
    _friendView.friendTable.delegate = self;
    _friendView.friendTable.dataSource = self;
    
    // tableView 偏移20/64适配
    if (@available(iOS 11.0, *)) {
        _friendView.friendTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    [_friendModel loadFriend];
    
}

#pragma mark 处理

-(void)onLoadHead{
    [_friendModel loadFriend];
}

- (void)friendList:(NSArray *)list{
    _chartList = [list mutableCopy];
    [_friendView.gifHeader endRefreshing];
}

#pragma mark tableView
//定义列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiter = @"FriendCellIdentifiter";
    _friendCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiter];
    if (_friendCell == nil) {
        _friendCell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiter];
    }
    NSUInteger row = [indexPath row];
    if(row<_chartList.count){
        _chartBean = [_chartList objectAtIndex:row];
        
        UIImage *img = [UIImage imageNamed:_chartBean.chartimg];
        _friendCell.displayImg.image = img;
        _friendCell.txtTitle.text = _chartBean.chartname;
        _friendCell.txtCon.text = _chartBean.chartjs;
    }
    return _friendCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_chartList count];
}

#pragma tableView的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _friendCell = [_friendView.friendTable cellForRowAtIndexPath:indexPath];
    if(_chartList.count>0){
        //界面跳转
        //self.tabBarController.tabBar.hidden=YES;
        self.hidesBottomBarWhenPushed=YES;
        ChartController *cc = [[ChartController alloc] init];
        NSString *cctitle = _friendCell.txtTitle.text;
        cc.title = cctitle;
        //[self.navigationController pushViewController:cc animated:YES];
        [self presentViewController:cc animated:YES completion:nil];
        self.hidesBottomBarWhenPushed=NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
