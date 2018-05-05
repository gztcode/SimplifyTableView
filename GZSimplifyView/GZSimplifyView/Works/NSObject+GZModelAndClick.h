//
//  NSObject+GZModelAndClick.h
//  GZWork
//
//  Created by Tim on 2018/2/26.
//  Copyright © 2018年 tim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (GZModelAndClick)

///数据传递
@property(nonatomic,strong) NSObject * gzModel;

///对应索引
@property(nonatomic,strong) NSIndexPath * gzIndexPath;

///缓存cell高度
@property(nonatomic,assign) CGFloat gzCellHeight;

///缓存高度
@property(nonatomic,copy) NSString *gzCellHeightStr;

///设置文字
@property(nonatomic,copy) NSString *gzStr;

///点击回调
@property(nonatomic,copy) void(^gzClick)(id click,NSIndexPath* gzIndexPath);

///判断是否存在Xib
- (BOOL)isExistenceXib;

@end
