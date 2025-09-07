//
//  DailyForecastCell.h
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DailyForecastCell : UITableViewCell
- (void)configWithDayInfo:(NSDictionary *)dayInfo;
@end

NS_ASSUME_NONNULL_END
