//
//  WeatherManager.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/30.
//

#import "WeatherManager.h"

@implementation WeatherManager
+ (instancetype)sharedManager {
    static WeatherManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WeatherManager alloc] init];
        sharedInstance.weatherArray = [NSMutableArray array];
    });
    return sharedInstance;
}
@end
