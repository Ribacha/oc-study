//
//  WeatherManager.h
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherManager : NSObject
@property (nonatomic, strong) NSMutableArray* weatherArray;
+ (instancetype)sharedManager;
@end

NS_ASSUME_NONNULL_END
