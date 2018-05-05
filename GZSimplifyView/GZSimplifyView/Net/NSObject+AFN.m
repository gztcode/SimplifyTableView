//
//  NSObject+AFN.m
//  AFNCode
//
//  Created by Tim on 2017/12/23.
//  Copyright © 2017年  Vidsai. All rights reserved.
//

#import "NSObject+AFN.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AFNetworking.h"
@implementation NSObject (AFN)
+(void)load{
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
}
+(AFHTTPSessionManager *)sharedAFN{
    static AFHTTPSessionManager * _sharedAFN =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAFN =[AFHTTPSessionManager manager];
        _sharedAFN.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone]; //安全策略为None
    });
    return _sharedAFN;
}
+(void)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                               success:(nullable void (^)(id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    [[self sharedAFN] GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        //加载速度就算了
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}
+(void)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                                success:(nullable void (^)(id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    [[self sharedAFN] POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //加载速度就算了
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failure(task,error);
    }];
}
+(void)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable id)file
                                success:(nullable void (^)(id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    [[self sharedAFN] POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        if ([file isKindOfClass:NSArray.class]) {
            for (id object in file) {
                if([object isKindOfClass:UIImage.class]){
                    [self updateImage:object formData:formData];
                }
            }
        }else if([file isKindOfClass:UIImage.class]){
            [self updateImage:file formData:formData];
        }else{
            NSLog(@"上传的类型不匹配或者Image为空");
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}

-(void)updateImage:(UIImage *)image formData:(id<AFMultipartFormData>)formData{
    NSDate *date = [NSDate date];
    NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
    [formormat setDateFormat:@"HHmmss"];
    NSString *dateString = [formormat stringFromDate:date];
    
    NSString *fileName = [NSString  stringWithFormat:@"%@.png",dateString];
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    double scaleNum = (double)300*1024/imageData.length;
    NSLog(@"图片压缩率：%f",scaleNum);
    if(scaleNum <1){
        imageData = UIImageJPEGRepresentation(image, scaleNum);
    }else{
        imageData = UIImageJPEGRepresentation(image, 0.1);
    }
    [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/png/JPEG"];

}
@end

