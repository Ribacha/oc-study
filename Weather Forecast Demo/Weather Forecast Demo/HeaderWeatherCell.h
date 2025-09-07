//
//  HeaderWeatherCell.h
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderWeatherCell : UITableViewCell
- (void)configWithCity:(NSString *)city temp:(NSString *)temp condition:(NSString *)condition;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *tempLabel;
@property (nonatomic, strong) UILabel *conditionLabel;
@end

NS_ASSUME_NONNULL_END
