//
//  VCWeatherPageController.h
//  Weather Forecast Demo
//
//  Created by 开开心心的macbook air on 2025/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCWeatherPageController : UIPageViewController
@property (nonatomic, strong) NSArray *weatherDataArray;
@property (nonatomic, assign) NSInteger initialPage;
- (void)setInitialPage:(NSInteger)page;
@end

NS_ASSUME_NONNULL_END
