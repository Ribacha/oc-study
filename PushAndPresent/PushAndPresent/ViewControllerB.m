//
//  ViewControllerB.m
//  PushAndPresent
//
//  Created by 开开心心的macbook air on 2025/9/4.
//

#import "ViewControllerB.h"
#import "ViewControllerC.h"
@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    UIButton* dismissBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [dismissBtn setTitle:@"Dismiss" forState:UIControlStateNormal];
    dismissBtn.frame = CGRectMake(50, 100, 200, 50);
    [dismissBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissBtn];
    
    UIButton* popBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [popBtn setTitle:@"Pop" forState:UIControlStateNormal];
    popBtn.frame = CGRectMake(50, 200, 200, 50);
    [popBtn addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
    
    UIButton* presentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [presentBtn setTitle:@"Present" forState:UIControlStateNormal];
    presentBtn.frame = CGRectMake(50, 300, 200, 50);
    [presentBtn addTarget:self action:@selector(presentC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentBtn];
    
    UIButton* pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pushBtn setTitle:@"Push C" forState:UIControlStateNormal];
    pushBtn.frame = CGRectMake(50, 400, 200, 50);
    [pushBtn addTarget:self action:@selector(pushC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}
- (void) dismissSelf {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) popSelf {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) presentC {
    ViewControllerC* vcC = [[ViewControllerC alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vcC];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void) pushC {
    ViewControllerC* vcC = [[ViewControllerC alloc] init];
    [self.navigationController pushViewController:vcC animated:YES];
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
