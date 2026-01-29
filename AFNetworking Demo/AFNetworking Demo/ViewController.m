//
//  ViewController.m
//  AFNetworking Demo
//
//  Created by 开开心心的macbook air on 2025/9/17.
//

#import "ViewController.h"
#import "NetWorkManager.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@property (nonatomic, strong) NSString *accessToken;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *clientID = @"c4370b7bcb6f44f6aaf9e8b102f90b1c";  // 你的 Spotify 客户端 ID
    NSString *clientSecret = @"caae12884c9c4843819829313e5ae6dc";  // 你的 Spotify 客户端密钥
    [self fetchAccessTokenWithClientID:clientID clientSecret:clientSecret];
}

// 使用 client_credentials 获取 access_token
- (void)fetchAccessTokenWithClientID:(NSString *)clientID
                      clientSecret:(NSString *)clientSecret {
    NSString *urlString = @"https://accounts.spotify.com/api/token";
    NSDictionary *parameters = @{
        @"grant_type": @"client_credentials",  // 使用客户端凭证流
        @"client_id": clientID,  // 你的 Spotify 客户端 ID
        @"client_secret": clientSecret  // 你的 Spotify 客户端密钥
    };
    
    // 创建 AFHTTPSessionManager 实例
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求头 Content-Type
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    // 设置响应处理
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 发起 POST 请求
    [manager POST:urlString
       parameters:parameters
          headers:nil
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              // 成功获取 access_token
              NSString *accessToken = responseObject[@"access_token"];
              self.accessToken = accessToken;  // 保存 access_token
              NSLog(@"Access Token: %@", accessToken);  // 打印 access_token
            NSString *accessTokentrue = accessToken;  // 通过之前的流程获取的 access_token
            // 假设你要获取 The Weeknd（歌手）的信息
            NSString *artistID = @"1Xyo4u8uXC1ZmMpatF05PJ";
        [self getSpotifyArtistInfoWithID:artistID token:accessToken];
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"Error fetching access token: %@", error);
          }];
}
// 通过 access_token 获取歌手信息
- (void)getSpotifyArtistInfoWithID:(NSString *)artistID token:(NSString *)accessToken {
    // 调用 NetWorkManager 的方法获取歌手数据
  [[NetWorkManager sharedManager] getArtistInfoWithID:artistID
                                                token:accessToken
                                           success:^(NSDictionary *response) {
   // 打印歌手信息
   NSLog(@"歌手信息: %@", response);

   // 例如，获取歌手的名字和流派
   NSString *name = response[@"name"];
   NSArray *genres = response[@"genres"];
   NSLog(@"歌手名字: %@", name);
   NSLog(@"流派: %@", genres);

  } failure:^(NSError *error) {
        NSLog(@"获取歌手信息失败: %@", error.localizedDescription);
    }];
}

@end
