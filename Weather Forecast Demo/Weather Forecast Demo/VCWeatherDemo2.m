//
//  VCWeatherDemo2.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/29.
//

#import "VCWeatherDemo2.h"
#import "WeatherCell1.h"
#import "VCSearchPage.h"
#import "WeatherManager.h"
#import "VCWeatherDetail2.h"
#import "VCWeatherPageController.h"
@interface VCWeatherDemo2 ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSDictionary* citydata;
@end

@implementation VCWeatherDemo2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"天气预报";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[WeatherCell1 class] forCellReuseIdentifier:@"WeatherCell1"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"+"] style:UIBarButtonItemStyleDone target:self action:@selector(SearchVC)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addCityToList:) name:@"AddCityToHomePage" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTable) name:@"CityDeletedFromDetail" object:nil];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void) addCityToList :(NSNotification*) notification {
    NSDictionary* cityData = notification.userInfo[@"cityData"];
//    NSLog(@"%@", cityData);
    NSString* newCityName = cityData[@"location"][@"name"];
    BOOL alreadyExists = NO;
    for (NSDictionary* existingCity in [WeatherManager sharedManager].weatherArray) {
        NSString* existingCityName = existingCity[@"location"][@"name"];
        if ([existingCityName isEqualToString:newCityName]) {
            alreadyExists = YES;
            break;
        }
    }
    if (!alreadyExists) {
        [[WeatherManager sharedManager].weatherArray addObject:cityData];
        [self.tableView reloadData];
        NSLog(@"添加城市成功：%@", newCityName);
        NSLog(@"WeatherArray 当前个数：%lu", (unsigned long)[WeatherManager sharedManager].weatherArray.count);
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你已经添加过了" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [WeatherManager sharedManager].weatherArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell1* cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell1" forIndexPath:indexPath];
    UIView* oldImageView = [cell.contentView viewWithTag:999];
        if (oldImageView) {
            [oldImageView removeFromSuperview];
        }
    NSDictionary* data = [WeatherManager sharedManager].weatherArray[indexPath.row];
    NSInteger code = [data[@"current"][@"condition"][@"code"] integerValue];
    cell.weatherLabel.text = [NSString stringWithFormat:@"%@", data[@"current"][@"condition"][@"text"]];
    cell.cityLabel.text = [NSString stringWithFormat:@"%@", data[@"location"][@"name"]];
    cell.tempLabel.text = [NSString stringWithFormat:@"%@", data[@"current"][@"temp_c"]];
    NSString* imageName = nil;
    if (code == 1000) {
        imageName = @"晴天";
    } else if (code == 1003 || code == 1006) {
        imageName = @"多云";
    } else if (code == 1009) {
        imageName = @"多云";
    } else if (code >= 1063 && code <= 1201) {
        imageName = @"雨天";
    } else if (code == 1030 || code == 1135 || code == 1147) {
        imageName = @"雾天";
    } else if (code == 1273 || code == 1276 || code == 1087) {
        imageName = @"雷暴冰雹";
    } else {
        imageName = @"默认天气";
    }
    UIImage* image = [UIImage imageNamed:imageName];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = cell.contentView.bounds;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.frame = CGRectMake(10, 5, tableView.bounds.size.width - 20, 120);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 45;
    imageView.layer.masksToBounds = YES;
    imageView.tag = 999;
    [cell.contentView insertSubview:imageView atIndex:0];

    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2);
    cell.layer.shadowOpacity = 0.1;
    cell.layer.shadowRadius = 4;
    cell.layer.masksToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.layer.cornerRadius = 45;
    cell.contentView.layer.masksToBounds = YES;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (void) SearchVC {
    VCSearchPage* searchVC = [[VCSearchPage alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AddCityToHomePage" object:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        VCWeatherPageController *pageVC = [[VCWeatherPageController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [pageVC setInitialPage:indexPath.row];
        [self.navigationController pushViewController:pageVC animated:YES];
}
- (void) refreshTable {
    [self.tableView reloadData];
}
@end
