//
//  GZViewController.m
//  GZWork
//
//  Created by Tim on 2018/2/25.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "GZViewController.h"
#import "GZTableView.h"
#import "GZTableViewCell.h"
#import "CEshiTableViewCell.h"
#import "HHTableViewCell.h"

@interface GZViewController ()<UITableViewDataSource>

@end

@implementation GZViewController
#pragma mark 懒加载
-(GZTableView *)gzTableView{
    if (!_gzTableView) {
        _gzTableView =[[GZTableView alloc] init];
        _gzTableView.isFigure =YES;
        _gzTableView.cellId = ^NSString *(NSIndexPath *indexPath, NSArray<NSDictionary<NSString *,Class> *> *registerCellClass) {
            if (indexPath.row  == 0) {
                return registerCellClass[0].allKeys.lastObject;
            }
            if (indexPath.row  < 10) {
                return registerCellClass[1].allKeys.lastObject;
            }
            if (indexPath.row  < 15) {
                return registerCellClass[2].allKeys.lastObject;
            }
            return registerCellClass[3].allKeys.lastObject;
        };
        _gzTableView.registerCellClass =@[GZTableViewCell.class,CEshiTableViewCell.class,HHTableViewCell.class];
        //判断是否自己实现数据源协议
        if ([self.class instancesRespondToSelector:@selector(tableView:numberOfRowsInSection:)] && [self.class instancesRespondToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
             _gzTableView.dataSource =self;
        }
        [self.view addSubview:_gzTableView];
    }
    return _gzTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gzTableView.frame =self.view.bounds;
    self.gzTableView.gzDataSource =@[@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1].mutableCopy;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
