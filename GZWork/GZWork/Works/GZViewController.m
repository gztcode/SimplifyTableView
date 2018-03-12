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

@interface GZViewController ()

@end

@implementation GZViewController
#pragma mark 懒加载
-(GZTableView *)gzTableView{
    if (!_gzTableView) {
        _gzTableView =[[GZTableView alloc] init];
//        _gzTableView.cellId = ^NSString *(NSIndexPath *indexPath) {
//            return @"cell";
//        };
        _gzTableView.registerCellClass =@[GZTableViewCell.class];
        
        
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
