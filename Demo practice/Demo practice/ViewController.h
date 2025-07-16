//
//  ViewController.h
//  Demo practice
//
//  Created by 开开心心的macbook air on 2025/6/11.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, assign) int imageCount;
@property (nonatomic, strong) NSTimer* timer;

@end

