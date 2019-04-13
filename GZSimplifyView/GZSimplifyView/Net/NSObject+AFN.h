//
//  NSObject+AFN.h
//  AFNCode
//
//  Created by Tim on 2017/12/23.
//  Copyright © 2017年  Vidsai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@interface NSObject (AFN)
/**  GET 请求
 *  URLString  URL
 *  parameters 请求参数
 *  成功返回
 *  失败返回
 */
+(void)GET:(NSString *_Nullable)URLString
parameters:(nullable id)parameters
   success:(nullable void (^)(id _Nullable responseObject))success
   failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
/**  POST 请求
 *  URLString  URL
 *  parameters 请求参数
 *  成功返回
 *  失败返回
 */
+(void)POST:(NSString *_Nullable)URLString
 parameters:(nullable id)parameters
    success:(nullable void (^)(id _Nullable responseObject))success
    failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
/**  POST 文件图片
 *  URLString  URL
 *  parameters 请求参数
 *  file       需要上传的文件单个直接Image对象多个把Image对象存放到数组中
 *  成功返回
 *  失败返回
 */
+(void)POST:(NSString *)URLString
 parameters:(nullable id)parameters
constructingBodyWithBlock:(nullable id)file
    success:(nullable void (^)(id _Nullable responseObject))success
    failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
@end
NS_ASSUME_NONNULL_END
