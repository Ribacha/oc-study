//
//  VCWeatherDetail2.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/30.
//

// VCWeatherDetail2.m（表格版）
#import "VCWeatherDetail2.h"
#import "WeatherManager.h"
#import "HeaderWeatherCell.h"
#import "HourlyForecastCell.h"
#import "InfoCell.h"
#import "DailyForecastCell.h"

@interface VCWeatherDetail2 () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *currentWeather;
@property (nonatomic, strong) NSArray *hourArray;
@property (nonatomic, strong) NSArray *forecastArray;
@property (nonatomic, strong) NSDictionary *locationInfo;
@end

@implementation VCWeatherDetail2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary *data = [WeatherManager sharedManager].weatherArray[self.xmo];
    self.currentWeather = data[@"current"];
    NSArray *todayHours = data[@"forecast"][@"forecastday"][0][@"hour"];
    NSArray *tomorrowHours = nil;
    if ([data[@"forecast"][@"forecastday"] count] > 1) {
        tomorrowHours = data[@"forecast"][@"forecastday"][1][@"hour"];
    }
    NSMutableArray *allHours = [NSMutableArray arrayWithArray:todayHours];
    if (tomorrowHours) {
        [allHours addObjectsFromArray:tomorrowHours];
    }
    self.hourArray = allHours;
    self.forecastArray = data[@"forecast"][@"forecastday"];
    self.locationInfo = data[@"location"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColor.clearColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[HeaderWeatherCell class] forCellReuseIdentifier:@"HeaderWeatherCell"];
    [self.tableView registerClass:[HourlyForecastCell class] forCellReuseIdentifier:@"HourlyForecastCell"];
    [self.tableView registerClass:[InfoCell class] forCellReuseIdentifier:@"InfoCell"];
    [self.tableView registerClass:[DailyForecastCell class] forCellReuseIdentifier:@"DailyForecastCell"];
    [self addBackgroundForWeatherCode:[self.currentWeather[@"condition"][@"code"] intValue]];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return self.forecastArray.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            return 300;
        }
        case 1: {
            return 100;
        }
        case 2: {
            return 90;
        }
        case 3: {
            return 400;
        }
        default: {
            return 44;
        }
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HeaderWeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderWeatherCell"];
        NSString *city = self.locationInfo[@"name"];
        NSString *temp = [NSString stringWithFormat:@"%@", self.currentWeather[@"temp_c"]];
        NSString *condition = self.currentWeather[@"condition"][@"text"];
        [cell configWithCity:city temp:temp condition:condition];
        return cell;
    } else if (indexPath.section == 1) {
        HourlyForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HourlyForecastCell"];
        [cell configWithHours:self.hourArray];
        return cell;
    } else if (indexPath.section == 2) {
        DailyForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailyForecastCell"];
            if (!cell) {
                cell = [[DailyForecastCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DailyForecastCell"];
                }
            NSDictionary *dayInfo = self.forecastArray[indexPath.row];
            [cell configWithDayInfo:dayInfo];
            return cell;
    } else if (indexPath.section == 3) {
        InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoCell"];
        [cell configWithInfo:self.currentWeather forecast:self.forecastArray[0]];
        return cell;
    } else {
        return nil;
    }
}
- (void)addBackgroundForWeatherCode:(int)code {
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIImageView class]] && subview.tag == 999) {
            [subview removeFromSuperview];
        }
    }
    NSString *imageName = nil;
    if (code == 1000) {
        imageName = @"晴天";
    } else if (code == 1003 || code == 1006 || code == 1009) {
        imageName = @"多云";
    } else if (code >= 1063 && code <= 1201) {
        imageName = @"雨天";
    } else if (code == 1030 || code == 1135 || code == 1147) {
        imageName = @"雾天";
    } else if (code == 1273 || code == 1276 || code == 1087) {
        imageName = @"雷暴冰雹";
    } else {
        imageName = @"多云";
    }
    if (imageName) {
        UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
        bg.image = [UIImage imageNamed:imageName];
        bg.contentMode = UIViewContentModeScaleAspectFill;
        bg.tag = 999;
        self.tableView.backgroundView = bg;
    }
}
@end
