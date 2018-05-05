//
//  GZTableView.m
//  GZWork
//
//  Created by Tim on 2018/2/25.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "GZTableView.h"
#import "NSObject+GZModelAndClick.h"
#import <objc/message.h>
#import "NSObject+Runtime.h"
#import "UIView+GZAdd.h"

@implementation UITableView(Exchange_method)

+(void)load{
    
    Method setDataSource = class_getInstanceMethod([self class], @selector(setDataSource:));
    Method exchange_method = class_getInstanceMethod([self class], @selector(exchange_method:));
    method_exchangeImplementations(setDataSource, exchange_method);
    
}

-(void)exchange_method:(NSObject *)className{
    if ([className.class instancesRespondToSelector:@selector(tableView:numberOfRowsInSection:)] && [className.class instancesRespondToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
        [self exchange_method:className];
    }else{
        [self exchange_method:self];
    }
}



@end


@interface GZTableView()
@property(nonatomic,strong) NSArray<NSDictionary <NSString *,Class>*> * registerCellId;
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
    __block NSMutableArray * dicRegister =@[].mutableCopy;
    [registerCellClass enumerateObjectsUsingBlock:^(Class  _Nonnull objCell, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([objCell isExistenceXib]) {
            NSArray<UITableViewCell *> * array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(objCell) owner:self options:nil];
            if (array.count >1) {
                [array enumerateObjectsUsingBlock:^(UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [dicRegister addObject:@{obj.reuseIdentifier:obj.class}];
                }];
            }else{
                [array enumerateObjectsUsingBlock:^(UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [self registerNib:[UINib nibWithNibName:NSStringFromClass(obj.class) bundle:nil] forCellReuseIdentifier:obj.reuseIdentifier?:NSStringFromClass(obj.class)];
                    [dicRegister addObject:@{obj.reuseIdentifier?:NSStringFromClass(obj.class):obj.class}];
                }];
            }
           
        }else{
            [self registerClass:objCell forCellReuseIdentifier:NSStringFromClass(objCell)];
            [dicRegister addObject:@{NSStringFromClass(objCell):objCell.class}];
        }
    }];
    self.registerCellId = dicRegister.copy;
   
}
-(void)setGzDataSource:(NSMutableArray *)gzDataSource{
    _gzDataSource = gzDataSource;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isGroup) {
        return ((NSArray *)self.gzDataSource[section]).count;
    }
    return self.gzDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * identifier = _isFigure?[_registerCellClass.firstObject isExistenceXib]?!self.cellId?NSStringFromClass(_registerCellClass.firstObject):self.cellId(indexPath,self.registerCellId):NSStringFromClass(_registerCellClass.firstObject):NSStringFromClass(_registerCellClass.firstObject);
    
   
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        Class className =nil;
        NSArray * arrayClasss =[self.registerCellId mutableArrayValueForKeyPath:identifier];
        for (Class name in arrayClasss) {
            if (![name isKindOfClass:NSNull.class]) {
                className =name;
            }
        }
        if ([className isKindOfClass:NSNull.class]) {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(UITableViewCell.class)];
        }
        if ([className isExistenceXib]) {
            NSArray<UITableViewCell *> * array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(className.class) owner:self options:nil];
            for (int i = 0; i < array.count; i++) {
                if ([identifier isEqualToString:array[i].reuseIdentifier]) {
                    cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(className.class) owner:self options:nil] objectAtIndex:i];
                }
            }
        }
    }
    //设置索引
    cell.gzIndexPath =indexPath;
    //设置数据
    if (_isGroup) {
        cell.gzModel =self.gzDataSource[indexPath.section][indexPath.row];
    }else{
        cell.gzModel = self.gzDataSource[indexPath.row];
    }
    
    __weak typeof(self) weakSelf =self;
    cell.gzClick = ^(id click, NSIndexPath *gzIndexPath) {
        !weakSelf.gzClick?:weakSelf.gzClick(click,indexPath);
    };
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_isGroup) {
       return self.gzDataSource.count;
    }
    return DOMAIN;
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.headerTitle[section];
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.headerTitle[section];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return _isEditing;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return _isMove;
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _indexTitles;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
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
    [self.gzDataSource exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    [self exchangeSubviewAtIndex:sourceIndexPath.row withSubviewAtIndex:destinationIndexPath.row];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}



@end
