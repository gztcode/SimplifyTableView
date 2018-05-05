//
//  NSObject+VSNet.h
//  VidSai
//
//  Created by Tim on 2017/12/23.
//  Copyright © 2017年 Vidsai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+AFN.h"

//设置请求地址
static const NSString * rootUrl = @"http://192.168.1.1";    //测试地址

@interface NSObject (GZNet)

typedef void(^Success)(id responseObject);
typedef void(^Failure)(NSURLSessionDataTask * task, NSError * error);

typedef NS_ENUM(NSInteger, GZNetWorkState) {
    GZNetWorkGET,
    GZNetWorkPOST,
    GZNetWorkUPDATE,
    GZNetWork
};


/**
 GET网络请求入口方法调用者接口地址

 @param parameters 参数
 @param success 成功返回数据
 @param failure 失败返回数据
 */
+ (void)gzGetNetWorking:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;
/**
 POST网络请求入口方法调用者接口地址

 @param parameters 参数
 @param success 成功返回数据
 @param failure 失败返回数据
 */
+ (void)gzPostNetWorking:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 POST网络请求入口方法调用者接口地址
 @param parameters 参数
 @param file        需要发送的文件
 @param success 成功返回数据
 @param failure 失败返回数据
*/
+ (void)gzPostUploadNetWorking:(NSDictionary *)parameters constructingFile:(nullable id)file success:(Success)success failure:(Failure)failure;


@end
