//
//  WeatherCell1.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/29.
//

#import "WeatherCell1.h"

@implementation WeatherCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 90, 200, 20)];
        self.weatherLabel.font = [UIFont boldSystemFontOfSize:20];
        self.weatherLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.weatherLabel];
        
        self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 240, 70)];
        self.cityLabel.font = [UIFont boldSystemFontOfSize:40];
        self.cityLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cityLabel];
        
        self.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 20, 100, 80)];
        self.tempLabel.font = [UIFont boldSystemFontOfSize:40];
        self.tempLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.tempLabel];
    }
    return self;
}
@end
