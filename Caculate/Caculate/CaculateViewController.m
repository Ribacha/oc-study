//
//  CaculateViewController.m
//  Caculate
//
//  Created by 开开心心的macbook air on 2025/9/25.
//

#import "CaculateViewController.h"
#import "CaculateView.h"
#import "CaculateModel.h"
@interface CaculateViewController ()
@property CaculateView *caculateView;
@property (nonatomic, strong) CaculateModel *model;
@property (nonatomic, strong) NSMutableString *inputString;
@end

@implementation CaculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[CaculateModel alloc] init];
    self.caculateView = [[CaculateView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.caculateView];
    self.inputString = [NSMutableString string];
    [self setupButtonEvents];
}
- (void) setupButtonEvents {
    for (UIView *subview in self.caculateView.subviews) {
            if ([subview isKindOfClass:[UIButton class]]) {
                UIButton *btn = (UIButton *)subview;
                [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
}
- (void)buttonPressed:(UIButton *)sender {
    NSString *title = sender.currentTitle;
    if ([title isEqualToString:@"AC"]) {
        [self.inputString setString:@""];
        self.caculateView.displayTextField.text = @"0";
    } else if ([title isEqualToString:@"="]) {
        NSString *expression = [self.inputString copy];
        NSDecimalNumber *result = [self.model calculateExpression:expression];
        if (result) {
            self.caculateView.displayTextField.text = result.stringValue;
            [self.inputString setString:result.stringValue];
        } else {
            self.caculateView.displayTextField.text = @"错误";
            [self.inputString setString:@""];
        }
    } else {
        if (self.inputString.length >= 20) {
            return;
        }
        [self.inputString appendString:title];
        self.caculateView.displayTextField.text = self.inputString;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
