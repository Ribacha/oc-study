//
//  DailyForecastCell.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import "DailyForecastCell.h"

// DailyForecastCell.m

@interface DailyForecastCell ()
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *tempLabel;
@end

@implementation DailyForecastCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 100, 40)];
        self.dateLabel.font = [UIFont boldSystemFontOfSize:25];
        self.dateLabel.textColor = UIColor.whiteColor;
        [self.contentView addSubview:self.dateLabel];

        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(130, 30, 40, 40)];
        [self.contentView addSubview:self.iconView];

        self.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 30, 190, 40)];
        self.tempLabel.font = [UIFont boldSystemFontOfSize:18];
        self.tempLabel.textColor = UIColor.whiteColor;
        [self.contentView addSubview:self.tempLabel];

        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)configWithDayInfo:(NSDictionary *)dayInfo {
    NSString *date = dayInfo[@"date"];
    NSString *month = @"";
    NSString *day = @"";
    if (date.length >= 10) {
        month = [date substringWithRange:NSMakeRange(5, 2)];
        day   = [date substringWithRange:NSMakeRange(8, 2)];
    }
    self.dateLabel.text = [NSString stringWithFormat:@"%@-%@", month, day];
    NSString *iconPath = dayInfo[@"day"][@"condition"][@"icon"];
    if ([iconPath isKindOfClass:[NSString class]]) {
        NSString *iconURL = [NSString stringWithFormat:@"https:%@", iconPath];
        NSURL *url = [NSURL URLWithString:iconURL];

        __weak UIImageView *weakIcon = self.iconView;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:url];
            if (data) {
                UIImage *img = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakIcon.image = img;
                });
            }
        });
    } else {
        self.iconView.image = nil;
    }

    NSString *maxTemp = [NSString stringWithFormat:@"%@", dayInfo[@"day"][@"maxtemp_c"] ?: @"-"];
    NSString *minTemp = [NSString stringWithFormat:@"%@", dayInfo[@"day"][@"mintemp_c"] ?: @"-"];
    self.tempLabel.text = [NSString stringWithFormat:@"最低%@°  最高%@°", minTemp, maxTemp];
}

@end
