//
//  VCWeatherDemo.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/28.
//

#import "VCWeatherDemo.h"

@interface VCWeatherDemo ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) NSArray<NSDictionary*> * citySearchResults;
@property (nonatomic, strong) UITableView * resultTableView;
@end

@implementation VCWeatherDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"天气查询";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}
- (void) textFieldDidChange:(UITextField*)textField {
    NSString *query = textField.text;
    if (query.length == 0) {
        self.citySearchResults = @[];
        [self.resultTableView reloadData];
        return ;
    }
    NSString *apiKey = @"8950a91429864a60a7b105904252508";
    NSString *encodeQuery = [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weatherapi.com/v1/search.json?key=%@&q=%@", apiKey, encodeQuery];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error || !data) {
            return;
        }
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![json isKindOfClass:[NSArray class]]) {
            return ;
        }
        self.citySearchResults = json;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.resultTableView reloadData];
            self.resultTableView.hidden = self.citySearchResults.count == 0;
        });
    }];
    [task resume];
}
- (void)setupUI {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, self.view.frame.size.width - 80, 40)];
    self.textField.placeholder = @"请输入城市名，如 New York";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    self.searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.searchButton.frame = CGRectMake((self.view.frame.size.width - 100)/2, 160, 100, 40);
    [self.searchButton setTitle:@"查询天气" forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(searchWeather) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchButton];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 220, self.view.frame.size.width - 80, 300)];
    self.resultLabel.numberOfLines = 0;
    self.resultLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.resultLabel];
    self.resultTableView = [[UITableView alloc] initWithFrame:CGRectMake(40, 150, self.view.frame.size.width - 80, 200)];
    self.resultTableView.delegate = self;
    self.resultTableView.dataSource = self;
    self.resultTableView.hidden = YES;
    [self.view addSubview:self.resultTableView];
}

- (void)searchWeather {
    NSString *city = self.textField.text;
    if (city.length == 0) return;

    NSString *apiKey = @"2eacf04ec3364b68bc282402252807";
    NSString *encodedCity = [city stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weatherapi.com/v1/forecast.json?key=%@&q=%@&lang=zh&days=7&aqi=yes&alerts=yes", apiKey, encodedCity];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            [self updateLabelText:@"天气查询失败"];
            return;
        }

        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![json isKindOfClass:[NSDictionary class]] || json[@"error"] != nil) {
            [self updateLabelText:@"未找到该城市天气"];
            return;
        }
        NSLog(@"%@", json);
        NSDictionary *location = json[@"location"];
        NSDictionary *current = json[@"current"];
        NSDictionary *forecast = json[@"forecast"];

        NSString *cityName = location[@"name"];
        NSString *region = location[@"region"];
        NSString *temp = [NSString stringWithFormat:@"%@", current[@"temp_c"]];
        NSString *condition = current[@"condition"][@"text"];
        
        NSMutableString *forecastResult = [NSMutableString string];
        [forecastResult appendFormat:@"%@ %@\n当前温度: %@℃\n天气: %@\n\n未来3天预报:\n",
                                    cityName, region, temp, condition];
        
        NSArray *forecastDays = forecast[@"forecastday"];
        if ([forecastDays isKindOfClass:[NSArray class]] && forecastDays.count > 0) {
            for (int i = 1; i < MIN(forecastDays.count, 4); i++) {
                NSDictionary *dayForecast = forecastDays[i];
                if (![dayForecast isKindOfClass:[NSDictionary class]]) continue;
                
                NSString *date = dayForecast[@"date"];
                NSDictionary *dayData = dayForecast[@"day"];
                
                NSString *maxTemp = [NSString stringWithFormat:@"%@", dayData[@"maxtemp_c"]];
                NSString *minTemp = [NSString stringWithFormat:@"%@", dayData[@"mintemp_c"]];
                NSString *dailyCondition = dayData[@"condition"][@"text"];
                NSString *rainChance = [NSString stringWithFormat:@"%@", dayData[@"daily_chance_of_rain"]];
                
                [forecastResult appendFormat:@"• %@: %@℃～%@℃ (%@%%) %@\n",
                                          [self formatDate:date], minTemp, maxTemp, rainChance, dailyCondition];
            }
        }
        
        [self updateLabelText:forecastResult];
    }];
    [task resume];
}

- (NSString *)formatDate:(NSString *)dateString {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [inputFormatter dateFromString:dateString];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"MM/dd"];
    [outputFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    return [outputFormatter stringFromDate:date];
}

- (void)updateLabelText:(NSString *)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.resultLabel.text = text;
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (![self.citySearchResults isKindOfClass:[NSArray class]]) {
        return 0;
    }
    return self.citySearchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    NSDictionary *city = self.citySearchResults[indexPath.row];
    cell.textLabel.text = city[@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", city[@"region"], city[@"country"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *city = self.citySearchResults[indexPath.row];
    self.textField.text = city[@"name"];
    self.resultTableView.hidden = YES;
    [self.textField resignFirstResponder];
    [self searchWeather]; // 发起天气查询
}
@end
