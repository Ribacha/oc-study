//
//  ViewController.m
//  YYModel Demo
//
//  Created by 开开心心的macbook air on 2025/9/18.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "Model.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *cityDict = @{@"name": @"西安"};
    [self searchWearth:cityDict];
}
- (void) searchWearth: (NSDictionary *) city {
    NSString *cityName = city[@"name"];
    if (cityName.length == 0) {
        return;
    }
    NSString *apiKey = @"8950a91429864a60a7b105904252508";
    NSString *encodeQuery = [cityName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weatherapi.com/v1/forecast.json?key=%@&q=%@&lang=zh&days=7", apiKey, encodeQuery];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:urlStr parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            return;
        }
        NSDictionary *JSONDict = responseObject;
        WeatherResponse *response = [WeatherResponse yy_modelWithDictionary:JSONDict];
//        NSLog(@"当前最高温度: %.1f, 天气: %@", response.current.temp_c, response.current.condition.text);
//        NSLog(@"back JSON Task %@", responseObject);
        NSLog(@"%@", JSONDict);
        NSLog(@"%@", response.forecast.forecastday);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败%@", error);
    }];
}

@end
