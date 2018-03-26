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
        _gzTableView.isGroup =YES;
        _gzTableView.isEditing =YES;
        _gzTableView.isMove =YES;
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
        _gzTableView.dataSource =self; //有加入想要防止数据源崩溃
        [self.view addSubview:_gzTableView];
    }
    return _gzTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gzTableView.frame =self.view.bounds;
    NSMutableArray * array = @[].mutableCopy;
    for (int i = 0; i < 30; i++) {
        [array addObject:@(i)];
    }
    self.gzTableView.gzDataSource =array;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"bian'ji" style:UIBarButtonItemStyleDone target:self action:@selector(ceshi)];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"结束" style:UIBarButtonItemStyleDone target:self action:@selector(ceshis)];
}

-(void)ceshi{
    NSLog(@"%s",__func__);
    [self.gzTableView setEditing:self.gzTableView.isEditing animated:YES];
}
-(void)ceshis{
    NSLog(@"%s",__func__);
    [self.gzTableView setEditing:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
