//
//  VCHomePage.h
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCHomePage : UIViewController
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, assign) int imageCount;
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, strong) UIButton *prevButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, assign) NSInteger currentIndex;
@end

NS_ASSUME_NONNULL_END
