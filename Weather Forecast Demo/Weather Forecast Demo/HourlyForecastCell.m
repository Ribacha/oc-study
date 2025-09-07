//
//  HourlyForecastCell.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import "HourlyForecastCell.h"

@interface HourlyForecastCell () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *hourlyData;
@end

@implementation HourlyForecastCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(70, 100);
        layout.minimumInteritemSpacing = 8;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.backgroundColor = UIColor.clearColor;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HourCell"];
        [self.contentView addSubview:self.collectionView];
        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.contentView.bounds;
}

- (void)configWithHours:(NSArray *)hours {
    NSMutableArray *filtered = [NSMutableArray array];
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    
    for (NSDictionary *hourInfo in hours) {
        NSString *timeString = hourInfo[@"time"];
        NSDate *forecastTime = [formatter dateFromString:timeString];
        if (!forecastTime) {
            continue;
        }
        // 只要 >= 当前时间的小时
        if ([forecastTime compare:now] != NSOrderedAscending) {
            [filtered addObject:hourInfo];
        }
        // 限制只取未来 24 条
        if (filtered.count >= 24) {
            break;
        }
    }
    
    self.hourlyData = filtered;
    [self.collectionView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hourlyData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HourCell" forIndexPath:indexPath];
    for (UIView* sub in cell.contentView.subviews) {
        [sub removeFromSuperview];
    }
    NSDictionary *hourInfo = self.hourlyData[indexPath.item];
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 20)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.font = [UIFont boldSystemFontOfSize:12];
    timeLabel.textColor = UIColor.whiteColor;
    NSString *fullTime = hourInfo[@"time"];
    NSString *shortTime = [[fullTime componentsSeparatedByString:@" "] lastObject];
    timeLabel.text = shortTime;
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 40, 40)];
    NSString *iconURL = [NSString stringWithFormat:@"https:%@", hourInfo[@"condition"][@"icon"]];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:iconURL]];
        if (data) {
            UIImage *img = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                iconView.image = img;
            });
        }
    });
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 70, 20)];
    tempLabel.textAlignment = NSTextAlignmentCenter;
    tempLabel.font = [UIFont boldSystemFontOfSize:14];
    tempLabel.textColor = UIColor.whiteColor;
    tempLabel.text = [NSString stringWithFormat:@"%@°", hourInfo[@"temp_c"]];
    [cell.contentView addSubview:timeLabel];
    [cell.contentView addSubview:iconView];
    [cell.contentView addSubview:tempLabel];

    return cell;
}

@end
