//
//  ViewController.m
//  Network Request
//
//  Created by 开开心心的macbook air on 2025/7/29.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *query = @"New York";
    NSString *apiKey = @"2eacf04ec3364b68bc282402252807";
    NSString *encodeQuery = [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weatherapi.com/v1/search.json?key=%@&q=%@", apiKey, encodeQuery];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error:%@", error.localizedDescription);
        } else {
            NSString* responseData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"response:%@", responseData);
        }
    }];
    [dataTask resume];
}


@end
