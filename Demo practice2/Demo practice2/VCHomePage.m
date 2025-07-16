//
//  VCHomePage.m
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import "VCHomePage.h"

@interface VCHomePage ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation VCHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    CGFloat width = 400;
    CGFloat height = 400;
    self.imageCount = 6;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, width, height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(width * (self.imageCount + 2), height);
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
        NSString* imageName = [NSString stringWithFormat:@"homeimage%d.jpg", index];
        UIImage* image = [UIImage imageNamed:imageName];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(width * i, 0, width, height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;//防止拉伸
        imageView.clipsToBounds = YES;
        [self.scrollView addSubview:imageView];
    }
    UIImage* image = [UIImage imageNamed:@"homeImage10.jpg"];
    UIImageView *ImageView = [[UIImageView alloc] initWithImage:image];
    ImageView.frame = CGRectMake(10, 10, image.size.width / 2, image.size.height / 2);
    

    [self.view addSubview:ImageView];
    [self.scrollView setContentOffset:CGPointMake(width, 0) animated:NO];
    [self.view addSubview:self.scrollView];
//    [self startTimer];
    [self setupButtons];
    [self.view bringSubviewToFront:ImageView];
}
- (void) startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
}
- (void) stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}
//自动滑动
- (void) autoScroll {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 400;
    int currentPage = offsetX / pageWidth;
    int nextPage = currentPage + 1;
    if (nextPage > self.imageCount + 1) {
        nextPage = 1;
    }
    [self.scrollView setContentOffset:CGPointMake(nextPage * pageWidth, 0) animated:YES];
}
//监听滑到的位置然后进行判断
- (void)adjustIfNeeded {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 400;
    int currentPage = round(offsetX / pageWidth);
    if (currentPage == 0) {
        [self.scrollView setContentOffset:CGPointMake(pageWidth * self.imageCount, 0) animated:NO];
    } else if (currentPage == self.imageCount + 1) {
        [self.scrollView setContentOffset:CGPointMake(pageWidth, 0) animated:NO];
    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self adjustIfNeeded];
        [self startTimer];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self adjustIfNeeded];
    [self startTimer];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self adjustIfNeeded];
}
- (void)setupButtons {
    CGFloat buttonWidth = 30;
    CGFloat buttonHeight = 40;
    CGFloat scrollViewWidth = 400;
    CGFloat scrollViewHeight = 750;
    CGFloat margin = 10;

    CGFloat centerY = (scrollViewHeight - buttonHeight) / 2;

    self.prevButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.prevButton.frame = CGRectMake(margin, centerY, buttonWidth, buttonHeight);
    UIImage* image2 = [UIImage imageNamed:@"向左箭头.PNG"];
    [self.prevButton setImage:image2 forState:UIControlStateNormal];
    [self.prevButton addTarget:self action:@selector(prevImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.prevButton];

    self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.nextButton.frame = CGRectMake(scrollViewWidth - buttonWidth - margin, centerY, buttonWidth, buttonHeight);
    UIImage* image3 = [UIImage imageNamed:@"向右箭头.PNG"];
    [self.nextButton setImage:image3 forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextButton];
}
- (void)prevImage {
    [self stopTimer];
    
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 400;
    int currentPage = offsetX / pageWidth;
    int prevPage = currentPage - 1;

    [self.scrollView setContentOffset:CGPointMake(prevPage * pageWidth, 0) animated:YES];
    
    [self startTimer];
}

- (void)nextImage {
    [self stopTimer];
    
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 400;
    int currentPage = offsetX / pageWidth;
    int nextPage = currentPage + 1;

    [self.scrollView setContentOffset:CGPointMake(nextPage * pageWidth, 0) animated:YES];
    
    [self startTimer];
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
