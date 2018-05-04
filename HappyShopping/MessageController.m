//
//  MessageController.m
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import "MessageController.h"

@interface MessageController ()<MessageModelDelegate,MessageViewDelegate,UITableViewDataSource, UITableViewDelegate>

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _msgModel = [MessageModel new];
    _msgView = [MessageView new];
    
    _msgList = [[NSMutableArray alloc] init];
    
    _msgView.frame = self.view.bounds;
    
    [self.view addSubview:_msgView];
    
    _msgModel.delegate = self;
    
    _msgView.delegate = self;
    
    _msgView.messageTable.delegate = self;
    
    _msgView.messageTable.dataSource = self;
    
    // tableView 偏移20/64适配
    if (@available(iOS 11.0, *)) {
        _msgView.messageTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [_msgModel loadMessage];
}

-(void)onLoadHead{
    [_msgModel loadMessage];
}

//成功的时候
- (void)msgSuccess:(int) code msgList:(NSArray *)list{
    _code = code;
    //_msglist = [list mutableCopy];
    
    //强制转换
    _msgList = (NSMutableArray *)list;
    //刷新
    [_msgView.messageTable reloadData];
    //结束头部刷新
    [_msgView.gifHeader endRefreshing];
}

//错误的时候
- (void)msgError:(int) code message:(NSString *)message{
    _code = code;
    _message = message;
    //获取失败的时候
    [self AlertTips:_message];
}

//失败的时候
- (void)msgFail:(int) code message:(NSString *)message{
    _code = code;
    _message = message;
    //获取失败的时候
    [self AlertTips:_message];
}

//弹出来一个对话框
-(void)AlertTips:(NSString *) message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _message = @"";
        _code = 0;
        //当出现没有网络的时候也要关闭刷新
        [_msgView.gifHeader endRefreshing];
        
    }];
    [alertController addAction:yesAction];
    [self presentViewController:alertController animated:true completion:nil];
}

#pragma mark tableView
//定义列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiter = @"MessageCellIdentifiter";
    _msgCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiter];
    if (_msgCell == nil) {
        _msgCell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiter];
    }
    NSUInteger row = [indexPath row];
    if(row<_msgList.count){
        _msgBean = [_msgList objectAtIndex:row];
        _msgCell.txtTitle.text = _msgBean.resultIdentifier;
        _msgCell.txtCon.text = _msgBean.catalog;
    }
    return _msgCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_msgList count];
}

//在里面操作
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    _msgCell = [_msgView.messageTable cellForRowAtIndexPath:indexPath];
    
    UITableViewRowAction *msgisred = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"标记已读" handler:^(UITableViewRowAction * action, NSIndexPath *indexPath) {
        if([_msgList count]>0){
            //执行删除操作
            NSLog(@"已经读了");
            _msgCell.isRed.text = @"已读";
        }
    }];
    
    UITableViewRowAction *msgdel = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * action, NSIndexPath *indexPath) {
        if([_msgList count]>0){
           //执行删除操作
            NSLog(@"已经移除");
            [_msgList removeObjectAtIndex:indexPath.row];
            [_msgView.messageTable deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
            //[_msgView.messageTable setEditing:YES animated:YES];
        }
    }];
    return @[msgdel,msgisred];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
