//
//  VCSearchPage.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/7/29.
//

#import "VCSearchPage.h"
#import "VCWeatherDetail.h"
@interface VCSearchPage ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITextField* textField;
@property (nonatomic, strong) UIButton* searchButton;
@property (nonatomic, strong) UITableView* resultTableView;
@property (nonatomic, strong) NSArray<NSDictionary*>* citySearchResults;
@property (nonatomic, strong) NSDictionary* cityDetail;
@end

@implementation VCSearchPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 280, 40)];
    self.textField.placeholder = @"请输入城市名，如 New York";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    self.searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.searchButton.frame = CGRectMake(310, 100, 80, 40);
    [self.searchButton setTitle:@"查询天气" forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(searchWeather2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchButton];
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.resultTableView = [[UITableView alloc] initWithFrame:CGRectMake(40, 150, 300, 700)];
    self.resultTableView.delegate = self;
    self.resultTableView.dataSource = self;
    self.resultTableView.hidden = YES;
    [self.view addSubview:self.resultTableView];
}
- (void) textFieldDidChange: (UITextField*) textField {
    NSString* query = textField.text;
    if (query.length == 0) {
        self.citySearchResults =@[];
        [self.resultTableView reloadData];
        return;
    }
    NSString* apiKey = @"8950a91429864a60a7b105904252508";
    NSString* encodeQuery = [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString* urlStr = [NSString stringWithFormat:@"https://api.weatherapi.com/v1/search.json?key=%@&q=%@", apiKey, encodeQuery];
    NSURL* url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error || !data) {
            return;
        }
        NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![json isKindOfClass:[NSArray class]]) {
            return;
        }
        self.citySearchResults = json;
        NSLog(@"%@", self.citySearchResults);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.resultTableView reloadData];
            self.resultTableView.hidden = self.citySearchResults.count == 0;
        });
    }];
    [task resume];
}
- (void) searchWeather2: (UIButton*) sender {
    NSDictionary* city = @{@"name": self.textField.text ? : @""};
    [self searchWeather:city];
}
- (void) searchWeather: (NSDictionary*) city {
    NSString* cityName = city[@"name"];
    if (cityName.length == 0) {
        return;
    }
    NSString* apiKey = @"8950a91429864a60a7b105904252508";
    NSString* encodeQuery = [cityName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weatherapi.com/v1/forecast.json?key=%@&q=%@&lang=zh&days=7", apiKey, encodeQuery];
    NSURL* url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error || !data) {
            return;
        }
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![json isKindOfClass:[NSDictionary class]]) {
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            VCWeatherDetail *detailVC = [[VCWeatherDetail alloc] init];
            [self.navigationController pushViewController:detailVC animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"CityInfoNotification" object:nil userInfo:json];
            });
        });
    }];
    [task resume];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (![self.citySearchResults isKindOfClass:[NSArray class]]) {
        return 0;
    }
    return self.citySearchResults.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"CityCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    if (indexPath.row >= self.citySearchResults.count) {
            return [[UITableViewCell alloc] init];
        }
    NSDictionary *city = self.citySearchResults[indexPath.row];
    cell.textLabel.text = city[@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", city[@"country"], city[@"region"]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *city = self.citySearchResults[indexPath.row];
    self.textField.text = city[@"name"];
    self.resultTableView.hidden = YES;
    [self.textField resignFirstResponder];
    [self searchWeather:city];
}
@end
