//
//  ViewControllerB.m
//  ViewController Demo
//
//  Created by 开开心心的macbook air on 2025/9/10.
//

#import "ViewControllerB.h"
#import "ViewControllerA.h"
@interface ViewControllerB ()
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn1 setTitle:@"next_dismiss" forState:UIControlStateNormal];
    _btn1.frame = CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 200, 100);
    [self.view addSubview:_btn1];
    [_btn1 addTarget:self action:@selector(Next_dismiss) forControlEvents:UIControlEventTouchUpInside];
    _btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn2 setTitle:@"next_pop" forState:UIControlStateNormal];
    _btn2.frame = CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 + 150, 200, 100);
    [self.view addSubview:_btn2];
    [_btn2 addTarget:self action:@selector(Next_pop) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%s", __func__);
}
- (void) Next_dismiss {
    NSLog(@"--------b->a---------");
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) Next_pop {
    NSLog(@"--------b->a---------");
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loadView {
    [super loadView];
    NSLog(@"%s", __func__);
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __func__);
}
- (void)viewWillLayoutSubviews {
    NSLog(@"%s", __func__);
}
- (void)viewDidLayoutSubviews {
    NSLog(@"%s", __func__);
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s",__func__);
}
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s", __func__);
}
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __func__);
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
