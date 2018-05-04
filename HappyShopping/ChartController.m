//
//  ChartController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/30.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "ChartController.h"

@interface ChartController ()<ChartViewDelegate,UITableViewDataSource,UITableViewDelegate,ChartModelDelegate>{
    
}

@end

static NSString *identify = @"MKJChatTableViewCell";

@implementation ChartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _chartView = [ChartView new];
    
    _chartModel = [ChartModel new];
    
    _chartView.frame = self.view.bounds;
    
    [self.view addSubview:_chartView];
    
    _chartView.delegate = self;
    
    _chartModel.delegate = self;
    
    _chartView.chartTable.delegate = self;
    
    _chartView.chartTable.dataSource = self;
    
    //_chartView.txtField.delegate = self;
    
    [_chartView.chartTable registerClass:[ChartCell class] forCellReuseIdentifier:identify];
    
    // 小技巧，用了之后不会出现多余的Cell
    UIView *view = [[UIView alloc] init];
    
    _chartView.chartTable.tableFooterView = view;
    
    [KeyboardToolBar registerKeyboardToolBarWithTextField: _chartView.txtField];
    
    // 注册键盘的通知hide or show
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // 增加手势，点击弹回
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [self.view addGestureRecognizer:tap];
}

- (void)click:(UITapGestureRecognizer *)tap
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
// 监听键盘弹出
- (void)keyBoardShow:(NSNotification *)noti
{
    
    CGRect rec = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGSize size = rec.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    NSLog(@"%@",NSStringFromCGRect(rec));
    // 小于，说明覆盖了输入框
    if ([UIScreen mainScreen].bounds.size.height - rec.size.height < self.inputView.frame.origin.y + self.inputView.frame.size.height)
    {
        // 把我们整体的View往上移动
        CGRect tempRec = self.view.frame;
        tempRec.origin.y = - (rec.size.height);
        self.view.frame = tempRec;
    }
    // 由于可见的界面缩小了，TableView也要跟着变化Frame
    _chartView.chartTable.frame = CGRectMake(0, height+64, width, height - height-30-75-(height/2)-30);
    
    if (self.dataSouce.count != 0)
    {
        [_chartView.chartTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataSouce.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
}
// 监听键盘隐藏
- (void)keyboardHide:(NSNotification *)noti
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    self.view.frame = CGRectMake(0, 0, width, height);
    _chartView.chartTable.frame = CGRectMake(0, 64, width, height - 64 - 30);
}


- (void)onBtnClick{
    if (![_chartView.txtField.text isEqualToString:@""])
    {
        ChartBeans *chatModel = [[ChartBeans alloc] init];
        chatModel.msg = _chartView.txtField.text;
        chatModel.isRight = 1; // 0 or 1
        [_dataSouce addObject:chatModel];
        [_chartModel loadChart:chatModel.msg];
        
        [_chartView.chartTable reloadData];
        // 滚到底部  scroll so row of interest is completely visible at top/center/bottom of view
        if (_dataSouce.count > 0) {
            [_chartView.chartTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_dataSouce.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        }
    }
    
}
//返回按钮处理
- (void)onBackClick{
    // presentViewController退回
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChartCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    [cell refreshCell:self.dataSouce[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChartBeans *model = self.dataSouce[indexPath.row];
    CGRect rec =  [model.msg boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    return rec.size.height + 75;
    
}

- (NSMutableArray *)dataSouce
{
    if (_dataSouce == nil) {
        _dataSouce = [[NSMutableArray alloc] init];
    }
    return _dataSouce;
}

//成功的时候
- (void)chartSuccess:(int) code chart:(NSString*) chart{
    ChartBeans *chatModel = [[ChartBeans alloc] init];
    chatModel.isRight = 0;
    chatModel.msg = chart;
    [_dataSouce addObject:chatModel];
    [_chartView.chartTable reloadData];
    // 滚到底部  scroll so row of interest is completely visible at top/center/bottom of view
    if (_dataSouce.count > 0) {
        [_chartView.chartTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_dataSouce.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
}
//错误的时候
- (void)chartError:(int) code message:(NSString *)message{
    ChartBeans *chatModel = [[ChartBeans alloc] init];
    chatModel.isRight = 0;
    chatModel.msg = message;
    [_dataSouce addObject:chatModel];
    [_chartView.chartTable reloadData];
    // 滚到底部  scroll so row of interest is completely visible at top/center/bottom of view
    if (_dataSouce.count > 0) {
        [_chartView.chartTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_dataSouce.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
}
//失败的时候
- (void)chartFail:(int) code message:(NSString *)message{
    ChartBeans *chatModel = [[ChartBeans alloc] init];
    chatModel.isRight = 0;
    chatModel.msg = message;
    [_dataSouce addObject:chatModel];
    [_chartView.chartTable reloadData];
    // 滚到底部  scroll so row of interest is completely visible at top/center/bottom of view
    if (_dataSouce.count > 0) {
        [_chartView.chartTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_dataSouce.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
