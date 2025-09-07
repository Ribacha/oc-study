//
//  HeaderWeatherCell.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import "HeaderWeatherCell.h"

@implementation HeaderWeatherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 235, 300, 60)];
        self.cityLabel.font = [UIFont boldSystemFontOfSize:45];
        self.cityLabel.textColor = UIColor.whiteColor;
        [self.contentView addSubview: self.cityLabel];

        self.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 370, 150)];
        self.tempLabel.font = [UIFont boldSystemFontOfSize:100];
        self.tempLabel.textColor = UIColor.whiteColor;
        [self.contentView addSubview: self.tempLabel];

        self.conditionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 65)];
        self.conditionLabel.font = [UIFont boldSystemFontOfSize:50];
        self.conditionLabel.textColor = UIColor.whiteColor;
        [self.contentView addSubview: self.conditionLabel];
        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)configWithCity:(NSString *)city temp:(NSString *)temp condition:(NSString *)condition {
            self.cityLabel.text = city;
            self.tempLabel.text = [NSString stringWithFormat:@"%@°", temp];
            self.conditionLabel.text = condition;
}

@end
