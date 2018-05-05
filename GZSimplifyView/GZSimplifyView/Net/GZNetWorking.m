//
//  VSNetWorking.m
//  VidSai
//
//  Created by Tim on 2018/3/7.
//  Copyright © 2018年 Vidsai. All rights reserved.
//

#import "GZNetWorking.h"
#import "NSObject+YYModel.h"

extern NSMutableDictionary  * dicNetClassPath;
@implementation GZNetWorking

+(void)gzGetNetWorkingDataList:(NSDictionary *)dic success:(Success)success failure:(Failure)failure
{
    NSLog(@"%@",dicNetClassPath[NSStringFromClass(self.class)]);
    
    [self.class gzGetNetWorking:dic success:^(id responseObject) {
        NSLog(@"responseObject===%@", responseObject);
        success([self.class success:responseObject]);
    } failure:failure];
}

+(void)gzPostNetWorkingDataList:(NSDictionary *)dic success:(Success)success failure:(Failure)failure{
    [self.class gzPostNetWorking:dic success:^(id responseObject) {
        NSLog(@"responseObject===%@", responseObject);
        success([self.class success:responseObject]);
    } failure:failure];
}
+(void)gzPostUpdateNetWorkingDataList:(NSDictionary *)dic constructingFile:(nullable id)file success:(Success)success failure:(Failure)failure{
    [self.class gzPostUploadNetWorking:dic constructingFile:file success:success failure:failure];
}
//处理response的最外层data数据
+(id)success:(id)response{
    GZNetWorking *dataModel = [GZNetWorking modelWithJSON:response];
    if ([dataModel.data isKindOfClass:NSArray.class]) {
        return [NSArray modelArrayWithClass:self.class json:dataModel.data];
    }else{
        return [self.class modelWithJSON:dataModel.data];
    }

}



@end
