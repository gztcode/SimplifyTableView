//
//  NSObject+GZModelAndClick.m
//  GZWork
//
//  Created by Tim on 2018/2/26.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "NSObject+GZModelAndClick.h"
#import <objc/message.h>

@implementation NSObject (GZModelAndClick)

-(void)setGzModel:(NSObject *)gzModel{
    objc_setAssociatedObject(self, @selector(gzModel), gzModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSObject *)gzModel{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setGzIndexPath:(NSIndexPath *)gzIndexPath{
    objc_setAssociatedObject(self, @selector(gzIndexPath), gzIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSIndexPath *)gzIndexPath{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setGzClick:(void (^)(id, NSIndexPath *))gzClick{
    objc_setAssociatedObject(self, @selector(gzClick), gzClick, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void (^)(id, NSIndexPath *))gzClick{
    return objc_getAssociatedObject(self, _cmd);
}



- (BOOL)isExistenceXib{
    return [[NSBundle mainBundle] pathForResource:NSStringFromClass(self.class) ofType:@"nib"].length > 0;
}

@end
