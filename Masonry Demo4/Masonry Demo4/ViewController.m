//
//  ViewController.m
//  Masonry Demo4
//
//  Created by 开开心心的macbook air on 2025/8/25.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView* redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(100);
    }];
    
    UIButton* centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [centerButton setTitle:@"center" forState:UIControlStateNormal];
    [redView addSubview:centerButton];
    [centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(redView);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
}


@end
