//
//  QYFinancialRecordsController.m
//  wallet
//
//  Created by talking　 on 2019/6/23.
//  Copyright © 2019 talking　. All rights reserved.
//

#import "QYFinancialRecordsController.h"
#import "QYFinancialRecordsListCell.h"

@interface QYFinancialRecordsController ()
//当数据为空的时候 显示您还没数据
@property(nonatomic, strong)  UIView * noDataView;

@end

@implementation QYFinancialRecordsController{
    NSInteger currentSize;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //刷新
    self.refreshType = SKBaseTableVcRefreshTypeRefreshAndLoadMore;
//    self.tableView.estimatedRowHeight = 200;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;

    currentSize = 20;

    
    // 设置导航栏
    [self setUpItems];
    
    // 设置子视图
    [self setUpViews];
    
    
    // 请求数据
    [self loadDataRefreshIndex:0];
    
}
//下拉
- (void)sk_refresh {
    [super sk_refresh];
    currentSize = 20;
    [self loadDataRefreshIndex:0];
}

//加载更多
- (void)sk_loadMore {
    [super sk_loadMore];
    currentSize += 20;
    [self loadDataRefreshIndex:1];
}
- (void)loadDataRefreshIndex:(NSInteger)index{
    NSMutableDictionary *d = [NSMutableDictionary new];
    [d setValue:[NSString stringWithFormat:@"%d",1] forKey:@"pageNo"]; //分页
    [d setValue:[NSString stringWithFormat:@"%ld",currentSize] forKey:@"pageSize"];
    
    NSDictionary * input = d.copy;
    SKDefineWeakSelf;
    [CFQCommonServer cfqServerQYAPIgetManageRecordListWithInput:input Callback:^(id  _Nonnull response, BOOL success, NSString * _Nonnull message, NSString * _Nonnull code) {

        //1正在上拉刷新  默认是0
        if (index == 1) {

            // 停止上拉加载
            [self sk_endLoadMore];

        }else if (index == 0) {
            //结束刷新
            [self sk_endRefresh];
        }

        if (success) {
            weakSelf.dataArray = [CFQCommonModel modelArrayWithDictArray:response];
            if (weakSelf.dataArray.count) {

                //                SKLog(@"有数据");
                
                [SKUtils updateFooterTitle:weakSelf.tableView.mj_footer];
            }else {
                //                SKLog(@"数据为空");
            }

            weakSelf.noDataView.hidden = (weakSelf.dataArray.count != 0);
            [weakSelf sk_reloadData];

        }else {

        }
    }];
    
}

// 设置导航栏
- (void)setUpItems {
    
    self.navigationItem.title = @"搬砖记录";
}

// 设置子视图
- (void)setUpViews {
    
    //不需要分割线
    self.needCellSepLine = NO;

}
#pragma mark - UITableViewDelegate
//只有一个Section
- (NSInteger)sk_numberOfSections {
    return 1;
}
//cell 的数据源个数
- (NSInteger)sk_numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}
//cell
- (SKBaseTableViewCell *)sk_cellAtIndexPath:(NSIndexPath *)indexPath {
    
    QYFinancialRecordsListCell *cell = [QYFinancialRecordsListCell cellWithTableView:self.tableView];
    cell.model = self.dataArray[indexPath.row];
    cell.backgroundColor = SKCommonBgColor;
    return cell;
}
//cell高度
- (CGFloat)sk_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
//section headview高度
- (CGFloat)sk_sectionHeaderHeightAtSection:(NSInteger)section {
    return 0;
}
//headview背景颜色为clear
- (UIView *)sk_headerAtSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SKScreenWidth, 30)];
    view.backgroundColor = SKClearColor;
    return view;
}
//cell点击事件
- (void)sk_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(SKBaseTableViewCell *)cell {
    
}
- (UIView *)noDataView{
    if (!_noDataView) {
        _noDataView = [[UIView alloc] init];
        UIImageView * noDataImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"缺省页"]];
        noDataImageView.frame = CGRectMake(0, 0, CGRectGetWidth(noDataImageView.frame), CGRectGetHeight(noDataImageView.frame));
        //        UILabel * label = [UILabel new];
        //        label.font = [UIFont systemFontOfSize:14];
        //        label.textAlignment = NSTextAlignmentCenter;
        //        label.textColor = MS_RGB(102, 102, 102, 1);
        //        label.text = @"暂无数据";
        //        [_noDataView addSubview:label];
        [_noDataView addSubview:noDataImageView];
        [noDataImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_noDataView.mas_centerX);
            make.top.equalTo(_noDataView.mas_top);
        }];
        //        [label mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.equalTo(_noDataView).offset(15);
        //            make.right.equalTo(_noDataView).offset(-15);
        //            make.top.equalTo(noDataImageView.mas_bottom).offset(15);
        //            make.bottom.equalTo(_noDataView.mas_bottom);
        //        }];
        [self.tableView addSubview:_noDataView];
        [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.tableView.mas_centerY).offset(-90);
            make.left.equalTo(self.tableView.mas_left);
            make.width.equalTo(@(SKScreenWidth));
        }];
        _noDataView.hidden = YES;
    }
    return _noDataView;
}

@end
