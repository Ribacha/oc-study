//
//  Model.h
//  YYModel Demo
//
//  Created by 开开心心的macbook air on 2025/9/21.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

@interface Condition : NSObject
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *text;
@end

@interface CurrentWeather : NSObject
@property (nonatomic, assign) NSInteger cloud;
@property (nonatomic, strong) Condition *condition;
@property (nonatomic, assign) CGFloat temp_c;
@property (nonatomic, assign) CGFloat humidity;
@property (nonatomic, copy) NSString *last_updated;
@end

@interface Astro : NSObject
@property (nonatomic, copy) NSString *sunrise;
@property (nonatomic, copy) NSString *sunset;
@property (nonatomic, copy) NSString *moonrise;
@property (nonatomic, copy) NSString *moonset;
@end

@interface Day : NSObject
@property (nonatomic, assign) CGFloat maxtemp_c;
@property (nonatomic, assign) CGFloat mintemp_c;
@property (nonatomic, assign) CGFloat avgtemp_c;
@property (nonatomic, strong) Condition *condition;
@end

@interface HourWeather : NSObject
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) CGFloat temp_c;
@property (nonatomic, strong) Condition *condition;
@end

@interface ForecastDay : NSObject
@property (nonatomic, copy) NSString *date;
@property (nonatomic, strong) Astro *astro;
@property (nonatomic, strong) Day *day;
@property (nonatomic, strong) NSArray<HourWeather *> *hour;
@end

@interface Forecast : NSObject<YYModel>
@property (nonatomic, strong) NSArray<ForecastDay *> *forecastday;
@end

@interface WeatherResponse : NSObject<YYModel>
@property (nonatomic, strong) CurrentWeather *current;
@property (nonatomic, strong) Forecast *forecast;
@end
