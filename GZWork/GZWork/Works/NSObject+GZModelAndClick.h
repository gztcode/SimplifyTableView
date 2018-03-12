//
//  NSObject+GZModelAndClick.h
//  GZWork
//
//  Created by Tim on 2018/2/26.
//  Copyright © 2018年 tim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GZModelAndClick)

@property(nonatomic,strong) NSObject * gzModel;

@property(nonatomic,strong) NSIndexPath * gzIndexPath;

@property(nonatomic,copy) void(^gzClick)(id click,NSIndexPath* gzIndexPath);

///判断是否存在Xib
- (BOOL)isExistenceXib;

@end
