//
//  Model.m
//  YYModel Demo
//
//  Created by 开开心心的macbook air on 2025/9/21.
//

#import "Model.h"
#import "YYModel.h"
@implementation WeatherResponse
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"forecast" : [Forecast class]
    };
}
@end

@implementation Forecast
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"forecastday" : [ForecastDay class]
    };
}
@end

@implementation ForecastDay
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"hour" : [HourWeather class]
    };
}
@end

@implementation CurrentWeather
@end
@implementation Condition
@end
@implementation Astro
@end
@implementation Day
@end
@implementation HourWeather
@end
