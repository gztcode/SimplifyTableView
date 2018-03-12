//
//  GZTableView.h
//  GZWork
//
//  Created by Tim on 2018/2/25.
//  Copyright © 2018年 tim. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface GZTableView : UITableView<UITableViewDataSource>
///列表数据
@property(nonatomic,strong) NSMutableArray * gzDataSource;

///是否为不同样式Cell
@property(nonatomic,assign) BOOL isFigure;

///注册cell
@property(nonatomic,strong) NSArray<Class> * registerCellClass;

///使用哪一个Cell
@property(nonatomic,copy) NSString *(^cellId)(NSIndexPath * indexPath,NSArray <NSString *>*registerCellClass);

///头部标题
@property(nonatomic,assign) NSMutableArray <NSString *>* headerTitle;

///底部标题
@property(nonatomic,assign) NSMutableArray <NSString *>* footerTitle;

///是否允许编辑
@property(nonatomic,assign) BOOL isEditing;

///是否允许移动
@property(nonatomic,assign) BOOL isMove;

///添加索引
@property(nonatomic,strong) NSArray<NSString *> * indexTitles;

@end
