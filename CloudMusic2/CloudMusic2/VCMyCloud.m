//
//  VCMyCloud.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import "VCMyCloud.h"

@interface VCMyCloud ()

@end

@implementation VCMyCloud

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self applyInterfaceStyle:self.isDarkMode];

    // 根据深浅模式设置背景颜色
    if (self.isDarkMode) {
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    UIBarButtonItem* customBackButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1_微笑"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = customBackButton;
}

- (void)applyInterfaceStyle:(BOOL)isDark {
    if (@available(iOS 13.0, *)) {
        self.overrideUserInterfaceStyle = isDark ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
    }
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
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
