//
//  VCWeatherPageController.m
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import "VCWeatherPageController.h"
#import "VCWeatherDetail2.h"
#import "WeatherManager.h"

@interface VCWeatherPageController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, assign)NSInteger ind;
@end

@implementation VCWeatherPageController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* iconImage = [UIImage imageNamed:@"删除"];
    UIBarButtonItem* iconButton = [[UIBarButtonItem alloc] initWithImage:iconImage style:UIBarButtonItemStylePlain target:self action:@selector(DeleteInformation)];
    self.navigationItem.rightBarButtonItem = iconButton;
    self.dataSource = self;
    self.delegate = self;
    self.weatherDataArray = [WeatherManager sharedManager].weatherArray;
    NSInteger pageToShow = self.initialPage >= 0 && self.initialPage < self.weatherDataArray.count ? self.initialPage : 0;
    VCWeatherDetail2 *firstVC = [self viewControllerAtIndex:pageToShow];
    if (firstVC) {
        [self setViewControllers:@[firstVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        }
    self.view.clipsToBounds = YES;
    self.ind = pageToShow;
}
- (VCWeatherDetail2 *)viewControllerAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.weatherDataArray.count) {
        return nil;
    }
    VCWeatherDetail2 *detailVC = [[VCWeatherDetail2 alloc] init];
    detailVC.xmo = index;
    return detailVC;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = ((VCWeatherDetail2 *)viewController).xmo;
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = ((VCWeatherDetail2 *)viewController).xmo;
    self.ind = index;
    index++;
    return [self viewControllerAtIndex:index];
}
- (void)pageViewController:(UIPageViewController *)pageViewController
 didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers
   transitionCompleted:(BOOL)completed {
    if (completed) {
        VCWeatherDetail2 *currentVC = (VCWeatherDetail2 *)pageViewController.viewControllers.firstObject;
        self.ind = currentVC.xmo;
    }
}
- (void)setInitialPage:(NSInteger)page {
    _initialPage = page;
}
- (void) DeleteInformation {
    if (self.ind < [WeatherManager sharedManager].weatherArray.count) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"是否删除" message:@"您确定是否要删除" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* _Nonnull action) {
            [[WeatherManager sharedManager].weatherArray removeObjectAtIndex:self.ind];
            [self.navigationController popViewControllerAnimated:YES];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"CityDeletedFromDetail" object:nil];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];

        [alert addAction:confirm];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        NSLog(@"数组越界");
    }
}
@end
