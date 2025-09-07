//
//  ViewControllerA.m
//  PushAndPresent
//
//  Created by 开开心心的macbook air on 2025/9/4.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton* presentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [presentBtn setTitle:@"Present B" forState:UIControlStateNormal];
    presentBtn.frame = CGRectMake(50, 100, 200, 50);
    [presentBtn addTarget:self action:@selector(presentB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentBtn];
    
    UIButton* pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pushBtn setTitle:@"Push B" forState:UIControlStateNormal];
    pushBtn.frame = CGRectMake(50, 200, 200, 50);
    [pushBtn addTarget:self action:@selector(pushB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
   
}
- (void) presentB {
    ViewControllerB* vcB = [[ViewControllerB alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vcB];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void) pushB {
    ViewControllerB* vcB = [[ViewControllerB alloc] init];
    [self.navigationController pushViewController:vcB animated:YES];
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
