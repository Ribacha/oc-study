//
//  ViewController.m
//  Demo practice
//
//  Created by 开开心心的macbook air on 2025/6/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageCount = 3;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 394, 852)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(394 * (self.imageCount + 2), 852);
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    for (int i = 0; i < self.imageCount + 2; i++) {
        int index;
        if (i == 0) {
            index = self.imageCount;
        } else if (i == self.imageCount + 1) {
            index = 1;
        } else {
            index = i;
        }
        NSString* imageName = [NSString stringWithFormat:@"p%d.jpg", index];
        UIImage* image = [UIImage imageNamed:imageName];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(394 * i, 0, 394, 852);//横着
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentOffset:CGPointMake(394, 0) animated:NO];
    [self.view addSubview:self.scrollView];
    [self startTimer];
}
- (void) startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
}
- (void) stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}
- (void) autoScroll {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 394;
    int currentPage = offsetX / pageWidth;
    int nextPage = currentPage + 1;
    
    [self.scrollView setContentOffset:CGPointMake(nextPage * pageWidth, 0) animated:YES];
}
- (void)adjustIfNeeded {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 394;
    int currentPage = offsetX / pageWidth;
    if (currentPage == 0) {
        [self.scrollView setContentOffset:CGPointMake(pageWidth * self.imageCount, 0) animated:NO];
    } else if (currentPage == self.imageCount + 1) {
        [self.scrollView setContentOffset:CGPointMake(pageWidth, 0) animated:NO];
    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self adjustIfNeeded];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self adjustIfNeeded];
}

@end
