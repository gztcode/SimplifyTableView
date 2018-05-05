//
//  NSObject+VSNet.m
//  VidSai
//
//  Created by Tim on 2017/12/23.
//  Copyright © 2017年 Vidsai. All rights reserved.
//

#import "NSObject+GZNet.h"
#import <objc/message.h>
#import "NSObject+AFN.h"


NSMutableDictionary  * dicNetClassPath;

@implementation NSObject (GZNet)


///设置Class对应的请求地址
extern NSMutableDictionary  * dicNetClassPath;

+(void)load{
    dicNetClassPath = @{
                        ///这里必须传入指定的类名
                        NSStringFromClass(NSObject.class):[rootUrl stringByAppendingString:@"/api-sileo/v2/home-tournaments/popular/filter/"],
                        NSStringFromClass(NSObject.class):[rootUrl stringByAppendingString:@"/api-sileo/profile/profile_following/filter/"],
                        NSStringFromClass(NSObject.class):[rootUrl stringByAppendingString:@"/api-sileo/profile/profile_followers/filter/"],
                        NSStringFromClass(NSObject.class):[rootUrl stringByAppendingString:@"/api-sileo/v2/user/profile/"]
                        }.mutableCopy;
}


+ (NSObject *)NetWokring{
    return [[self alloc] init];
}

- (NSString *)network{
    return dicNetClassPath[NSStringFromClass(self.class)];
}

+ (void)gzGetNetWorking:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    [[self.class NetWokring] netWorking:GZNetWorkGET url:[self network] parameters:parameters constructingFile:nil success:success failure:failure];
}
+ (void)gzPostNetWorking:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
     [[self.class NetWokring] netWorking:GZNetWorkPOST url:[self network] parameters:parameters constructingFile:nil success:success failure:failure];
}

+(void)gzPostUploadNetWorking:(NSDictionary *)parameters constructingFile:(id)file success:(Success)success failure:(Failure)failure{
    [[self.class NetWokring] netWorking:GZNetWorkUPDATE url:[self network] parameters:parameters constructingFile:file success:success failure:failure];
}


- (void)netWorking:(GZNetWorkState)state url:(NSString *)url parameters:(NSDictionary *)parameters constructingFile:(nullable id)file success:(Success)success failure:(Failure)failure {
    NSLog(@"url===%@,parameters===%@", url, parameters);
    if (url.length <= 0) {
        NSLog(@"使用类名有误");
        NSLog(@"%@",dicNetClassPath);
        return;
    }
    switch (state) {
        case GZNetWorkGET:
             [self.class GET:url parameters:parameters success:success failure:failure];
            break;
        case GZNetWorkPOST:
            [self.class POST:url parameters:parameters success:success failure:failure];
            break;
        case GZNetWorkUPDATE:
            
            
            break;
        default:
            break;
    }
            
   
   
}


@end
