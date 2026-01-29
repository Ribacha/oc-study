//
//  VideoViewController.m
//  AVFoundation demo
//
//  Created by 开开心心的macbook air on 2025/10/27.
//

#import "VideoViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoViewController ()
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    // 添加加载指示器
    self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.loadingView.center = self.view.center;
    [self.view addSubview:self.loadingView];
    
    [self.loadingView startAnimating];
    
    // 调用方法：搜索并播放视频
    [self fetchAndPlayVideoWithQuery:@"kobe"];
}

#pragma mark - 使用 AFNetworking 请求 Pexels 视频
- (void)fetchAndPlayVideoWithQuery:(NSString *)query {
    NSString *apiKey = @"bIXCL4FV0NqV78lhxOBOJJxigIXQRz98wOHtOH978BK6MYFRFhGFjWzD"; // 在此填写你的 API Key
    NSString *encodedQuery = [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:@"https://api.pexels.com/videos/search?query=%@&per_page=1", encodedQuery];
    
    // 创建请求管理器
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:apiKey forHTTPHeaderField:@"Authorization"];
    [manager GET:urlString
      parameters:nil
         headers:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             [self.loadingView stopAnimating];
             
             NSArray *videos = responseObject[@"videos"];
             if (videos.count == 0) {
                 NSLog(@"没找到视频");
                 return;
             }
             
             NSDictionary *video = videos.firstObject;
             NSArray *videoFiles = video[@"video_files"];
             NSDictionary *firstFile = videoFiles.firstObject;
             NSString *videoURLStr = firstFile[@"link"];
             NSLog(@"视频直链: %@", videoURLStr);
             
             // 在主线程播放视频
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self playVideoWithURL:[NSURL URLWithString:videoURLStr]];
             });
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             [self.loadingView stopAnimating];
             NSLog(@"请求失败: %@", error.localizedDescription);
         }];
}

#pragma mark - 使用 AVPlayer 播放视频
- (void)playVideoWithURL:(NSURL *)url {
    self.player = [AVPlayer playerWithURL:url];
    
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    playerVC.player = self.player;
    playerVC.showsPlaybackControls = YES;
    
    [self presentViewController:playerVC animated:YES completion:^{
        [self.player play];
    }];
}

@end
