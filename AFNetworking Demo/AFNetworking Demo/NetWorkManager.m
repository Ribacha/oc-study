//
//  NetWorkManager.m
//  AFNetworking Demo
//
//  Created by 开开心心的macbook air on 2025/9/17.
//

#import "NetWorkManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation NetWorkManager

+ (instancetype)sharedManager {
    static NetWorkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetWorkManager alloc] init];
    });
    return instance;
}

// 创建 AFHTTPSessionManager 实例
- (AFHTTPSessionManager *)afManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.0f;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    return manager;
}

// 通过 access_token 获取歌手信息
- (void)getArtistInfoWithID:(NSString *)artistID token:(NSString *)accessToken success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure {
    NSString *urlString = [NSString stringWithFormat:@"https://api.spotify.com/v1/artists/%@", artistID];
    
    AFHTTPSessionManager *manager = [self afManager];
    
    // 设置请求头，Authorization 字段带上 Bearer token
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", accessToken] forHTTPHeaderField:@"Authorization"];
    
    [manager GET:urlString
      parameters:nil
        headers:nil
       progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 成功，返回歌手数据
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 失败，返回错误
            if (failure) {
                failure(error);
            }
        }];
}

@end
