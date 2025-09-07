//
//  VCWeatherDetail.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/29.
//

#import "VCWeatherDetail.h"
#import "HeaderWeatherCell.h"
#import "HourlyForecastCell.h"
#import "DailyForecastCell.h"
#import "InfoCell.h"
#import "WeatherManager.h"

@interface VCWeatherDetail () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *cityData;
@property (nonatomic, strong) NSDictionary *currentWeather;
@property (nonatomic, strong) NSArray *hourArray;
@property (nonatomic, strong) NSArray *forecastArray;
@property (nonatomic, strong) NSDictionary *locationInfo;
@property (nonatomic, assign) BOOL isAddMode;
@end

@implementation VCWeatherDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCityInfo:) name:@"CityInfoNotification" object:nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColor.clearColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[HeaderWeatherCell class] forCellReuseIdentifier:@"HeaderWeatherCell"];
    [self.tableView registerClass:[HourlyForecastCell class] forCellReuseIdentifier:@"HourlyForecastCell"];
    [self.tableView registerClass:[DailyForecastCell class] forCellReuseIdentifier:@"DailyForecastCell"];
    [self.tableView registerClass:[InfoCell class] forCellReuseIdentifier:@"InfoCell"];
    [self setupAddButton];
}
- (void)setupAddButton {
    UIImage *iconImage = [UIImage imageNamed:@"+"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:iconImage style:UIBarButtonItemStylePlain target:self action:@selector(addInformation)];
    self.navigationItem.rightBarButtonItem = addButton;
}
- (void)addInformation {
    self.isAddMode = YES;
    if (self.cityData) {
        [self receiveCityInfo:[NSNotification notificationWithName:@"Fake" object:nil userInfo:self.cityData]];
    }
}
- (void)receiveCityInfo:(NSNotification *)notification {
    self.cityData = notification.userInfo;
    self.currentWeather = self.cityData[@"current"];
    
    // 拼接今天 + 明天小时数据
    NSArray *todayHours = self.cityData[@"forecast"][@"forecastday"][0][@"hour"];
    NSArray *tomorrowHours = nil;
    if ([self.cityData[@"forecast"][@"forecastday"] count] > 1) {
        tomorrowHours = self.cityData[@"forecast"][@"forecastday"][1][@"hour"];
    }
    NSMutableArray *allHours = [NSMutableArray arrayWithArray:todayHours];
    if (tomorrowHours) {
        [allHours addObjectsFromArray:tomorrowHours];
    }
    self.hourArray = allHours;  // 这里传给 HourlyForecastCell
    
    self.forecastArray = self.cityData[@"forecast"][@"forecastday"];
    self.locationInfo = self.cityData[@"location"];
    [self.tableView reloadData];
    [self addBackgroundForWeatherCode:[self.currentWeather[@"condition"][@"code"] intValue]];
    
    if (self.isAddMode) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AddCityToHomePage" object:nil userInfo:@{ @"cityData": self.cityData }];
        self.isAddMode = NO;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return self.forecastArray.count; // 动态行数
            
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
        [cell configWithCity:self.locationInfo[@"name"]
                       temp:[NSString stringWithFormat:@"%@", self.currentWeather[@"temp_c"]]
                  condition:self.currentWeather[@"condition"][@"text"]];
        return cell;
    } else if (indexPath.section == 1) {
        HourlyForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HourlyForecastCell"];
        [cell configWithHours:self.hourArray];
        return cell;
    } else if (indexPath.section == 2) {
        DailyForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailyForecastCell"];
        [cell configWithDayInfo:self.forecastArray[indexPath.row]];
        return cell;
    } else if (indexPath.section == 3) {
        InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoCell"];
        [cell configWithInfo:self.currentWeather forecast:self.forecastArray.firstObject];
        return cell;
    }
    return nil;
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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
