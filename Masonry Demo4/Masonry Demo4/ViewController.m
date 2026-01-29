//
//  ViewController.m
//  Masonry Demo4
//
//  Created by 开开心心的macbook air on 2025/8/25.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
//@property (nonatomic, strong) UIView *redView;
//@property (nonatomic, assign) BOOL isBig;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.isBig = NO;
//    self.redView = [[UIView alloc] init];
//    self.redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.redView];
//    
//    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.height.mas_equalTo(100);
//    }];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button setTitle:@"点击改变" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(changeRedView) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(50);
//        make.centerX.equalTo(self.view);
//        make.height.mas_equalTo(40);
//    }];
    self.leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.leftButton setTitle:@"左按钮" forState:UIControlStateNormal];
    self.leftButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.rightButton setTitle:@"右按钮" forState:UIControlStateNormal];
    self.rightButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.rightButton];
    
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"请输入内容";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    self.label = [[UILabel alloc] init];
    self.label.text = @"我是label";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.label];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.bottom.equalTo(self.leftButton);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(40);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    
}
//- (void) changeRedView {
//    if (!self.isBig) {
//        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.height.mas_equalTo(200);
//        }];
//        self.isBig = YES;
//    } else {
//        [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.view.mas_bottom).offset(-100);
//            make.centerX.equalTo(self.view);
//            make.width.height.mas_equalTo(150);
//        }];
//        self.isBig = NO;
//    }
//}


@end
