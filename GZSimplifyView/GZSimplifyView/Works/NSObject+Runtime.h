//
//  NSObject+Runtime.h
//  Runtime
//
//  Created by ATabc on 2017/7/14.
//  Copyright © 2017年 郭振涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)
/** 获取成员变量，包括属性生成的成员变量 */
+ (NSArray *)gz_getIvarList;

/** 获取成员属性和对应的值 */
+ (NSArray *)gz_getAllIvar;

/** 获取类的属性列表，包括私有和公有属性，也包括分类中的属性 */
+ (NSArray *)gz_getPropertyList;

/** 获取对象方法列表：包括getter, setter, 分类中的方法等 */
+ (NSArray *)gz_getInstanceMethodList;

/** 获取类方法列表 包括分类里面的 */
+ (NSArray *)gz_getClassMethodList;

/** 获取协议列表，包括.h .m 和分类里的 */
+ (NSArray *)gz_getProtocolList;

/** 获取协议方法列表*/
+ (NSArray *)gz_getProtocolMethodName:(NSString *)methodName;

/** 添加一个方法 */
+ (void)addMethod:(SEL)methodSel methodImp:(SEL)methodImp;

/** 实例方法交换 */
+ (void)gz_swapMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;

/** 类方法交换 */
+ (void)gz_swapClassMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;

@end
