//
//  VSNetWorking.h
//  VidSai
//
//  Created by Tim on 2018/3/7.
//  Copyright © 2018年 Vidsai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+GZNet.h"

@interface GZNetWorking : NSObject

///状态码
@property(nonatomic,assign) int code;

///数据
@property(nonatomic,strong) id data;

///返回消息
@property(nonatomic,copy) NSString *msg;

/**
 GET网络请求(重写此方法可修改URL)

 @param dic 参数
 @param success 成功
 @param failure 失败
 */
+(void)gzGetNetWorkingDataList:(NSDictionary *)dic success:(Success)success failure:(Failure)failure;
/**
 POST网络请求(重写此方法可修改URL)
 
 @param dic 参数
 @param success 成功
 @param failure 失败
 */
+(void)gzPostNetWorkingDataList:(NSDictionary *)dic success:(Success)success failure:(Failure)failure;

/**
 POST网络请求上传文件(重写此方法可修改URL)
 
 @param dic 参数
 @param file    文件
 @param success 成功
 @param failure 失败
 */
+(void)gzPostUpdateNetWorkingDataList:(NSDictionary *)dic constructingFile:(nullable id)file success:(Success)success failure:(Failure)failure;

@end
