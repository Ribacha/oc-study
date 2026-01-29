//
//  ViewControllerA.m
//  ViewController Demo
//
//  Created by 开开心心的macbook air on 2025/9/10.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
@interface ViewControllerA ()
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    _btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn1 setTitle:@"next_view" forState:UIControlStateNormal];
    _btn1.frame = CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 200, 100);
    [self.view addSubview:_btn1];
    [_btn1 addTarget:self action:@selector(Next_present) forControlEvents:UIControlEventTouchUpInside];
    _btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn2 setTitle:@"next_view" forState:UIControlStateNormal];
    _btn2.frame = CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 + 150, 200, 100);
    [self.view addSubview:_btn2];
    [_btn2 addTarget:self action:@selector(Next_push) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%s", __func__);
}
- (void) Next_present {
    ViewControllerB *b = [[ViewControllerB alloc] init];
    NSLog(@"--------a->b---------");
    b.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:b animated:YES completion:nil];
}
- (void) Next_push {
    ViewControllerB *b = [[ViewControllerB alloc] init];
    NSLog(@"--------a->b---------");
    [self.navigationController pushViewController:b animated:YES];
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
