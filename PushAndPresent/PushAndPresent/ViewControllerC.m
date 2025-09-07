//
//  ViewControllerC.m
//  PushAndPresent
//
//  Created by 开开心心的macbook air on 2025/9/4.
//

#import "ViewControllerC.h"
#import "ViewControllerA.h"
@interface ViewControllerC ()

@end

@implementation ViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton* dismissBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [dismissBtn setTitle:@"DissmissA" forState:UIControlStateNormal];
    dismissBtn.frame = CGRectMake(50, 100, 200, 50);
    [dismissBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissBtn];
    
    UIButton* popBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [popBtn setTitle:@"PopA" forState:UIControlStateNormal];
    popBtn.frame = CGRectMake(50, 200, 200, 50);
    [popBtn addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
}
- (void) dismissSelf {
    UIViewController* rootVC = self;
    while (rootVC.presentingViewController) {
        rootVC = rootVC.presentingViewController;
    }
    [rootVC dismissViewControllerAnimated:YES completion:nil];
}
- (void) popSelf {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
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
