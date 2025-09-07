//
//  InfoCell.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import "InfoCell.h"

@interface InfoCell ()
@property (nonatomic, strong) NSArray<UILabel *> *labels;
@end

@implementation InfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSMutableArray *temp = [NSMutableArray array];
        CGFloat w = [UIScreen mainScreen].bounds.size.width / 2.0;
        CGFloat h = 80;

        for (int i = 0; i < 7; i++) {
            int row = i / 2;
            int col = i % 2;

            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(col * w + 15, row * h, w - 20, h)];
            label.textColor = UIColor.whiteColor;
            label.font = [UIFont boldSystemFontOfSize:25];
            [self.contentView addSubview:label];
            [temp addObject:label];
        }

        self.labels = temp;
        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)configWithInfo:(NSDictionary *)info forecast:(NSDictionary *)forecast {
    NSArray *titles = @[@"体感温度", @"湿度", @"风速", @"日出", @"气压", @"日落", @"UV"];
    NSArray *values = @[
        info[@"feelslike_c"] ?: @"-",
        info[@"humidity"] ?: @"-",
        info[@"wind_kph"] ?: @"-",
        forecast[@"astro"][@"sunrise"] ?: @"-",
        info[@"pressure_mb"] ?: @"-",
        forecast[@"astro"][@"sunset"] ?: @"-",
        info[@"uv"] ?: @"-"
    ];

    for (int i = 0; i < self.labels.count; i++) {
        self.labels[i].text = [NSString stringWithFormat:@"%@: %@", titles[i], values[i]];
    }
}

@end
