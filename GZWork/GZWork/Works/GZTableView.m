//
//  GZTableView.m
//  GZWork
//
//  Created by Tim on 2018/2/25.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "GZTableView.h"
#import "NSObject+GZModelAndClick.h"

@interface GZTableView()
@property(nonatomic,strong) NSArray<NSString *> * registerCellId;
@end


@implementation GZTableView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.dataSource=self;
}

-(void)setRegisterCellClass:(NSArray<Class> *)registerCellClass{
    _registerCellClass = registerCellClass;
    __block NSMutableArray * arrayRegister =@[].mutableCopy;
    [registerCellClass enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isExistenceXib]) {
            NSArray<UITableViewCell *> * array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(obj) owner:self options:nil];
            [array enumerateObjectsUsingBlock:^(UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self registerNib:[UINib nibWithNibName:NSStringFromClass(obj.class) bundle:nil] forCellReuseIdentifier:obj.reuseIdentifier];
                [arrayRegister addObject:obj.reuseIdentifier];
            }];
            
            
        }else{
            [self registerClass:obj forCellReuseIdentifier:NSStringFromClass(obj)];
            [arrayRegister addObject:NSStringFromClass(obj)];
        }
    }];
    self.registerCellId = arrayRegister.copy;
   
}
-(void)setGzDataSource:(NSMutableArray *)gzDataSource{
    _gzDataSource = gzDataSource;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.gzDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell;
    [_registerCellClass enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray<UITableViewCell *> * array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(obj) owner:self options:nil];
        if (array.count >1) {
            [array enumerateObjectsUsingBlock:^(UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
            }];
//           cell = [[NSBundle mainBundle] loadNibNamed:@"identifier" owner:nil options:nil][x]
        }
        
        
    }];
  
    
    cell =[tableView dequeueReusableCellWithIdentifier:_registerCellClass.count ==1?[_registerCellClass.firstObject isExistenceXib]?!self.cellId?NSStringFromClass(_registerCellClass.firstObject):self.cellId(indexPath,self.registerCellId):NSStringFromClass(_registerCellClass.firstObject):!self.cellId?NSStringFromClass([UITableViewCell class]):self.cellId(indexPath,self.registerCellId) forIndexPath:indexPath];
    
    cell.textLabel.text =@(indexPath.row).stringValue;
    cell.gzModel = self.gzDataSource[indexPath.row];
    cell.gzIndexPath =indexPath;
    __weak typeof(self) weakSelf =self;
    cell.gzClick = ^(id click, NSIndexPath *gzIndexPath) {
        !weakSelf.gzClick?:weakSelf.gzClick(click,indexPath);
    };
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_isFigure) {
       return self.gzDataSource.count;
    }
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString * asser =[NSString stringWithFormat:@"%s___%d___数据异常",__func__,__LINE__];
//    NSAssert(section <= self.headerTitle.count,asser); return nil;
//    return self.gzDataSource[section];
    return nil;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSString * asser =[NSString stringWithFormat:@"%s___%d___数据异常",__func__,__LINE__];
//    NSAssert(section <= self.footerTitle.count, asser); return nil;
//    return self.gzDataSource[section];
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return _isEditing;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return _isMove;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _indexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"%s——————%d",__FUNCTION__,__LINE__);
    switch (editingStyle) {
        case UITableViewCellEditingStyleNone:
            
            break;
        case UITableViewCellEditingStyleDelete:
            [self.gzDataSource removeObjectAtIndex:indexPath.row];
            [self reloadData];
            break;
        case UITableViewCellEditingStyleInsert:
            
            break;
    }
   
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSLog(@"%s——————%d",__FUNCTION__,__LINE__);
    [self exchangeSubviewAtIndex:sourceIndexPath.row withSubviewAtIndex:sourceIndexPath.row];
}





@end
