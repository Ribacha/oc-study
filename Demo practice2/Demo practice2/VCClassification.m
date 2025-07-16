//
//  VCClassification.m
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import "VCClassification.h"

@interface VCClassification ()

@end

@implementation VCClassification

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.segment = [[UISegmentedControl alloc] initWithItems:@[]];
    self.segment.frame = CGRectMake(100, 100, 200, 50);
    [self.segment insertSegmentWithTitle:@"男士" atIndex:0 animated:YES];
    [self.segment insertSegmentWithTitle:@"女士" atIndex:1 animated:YES];
    [self.segment insertSegmentWithTitle:@"儿童" atIndex:2 animated:YES];
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(indexChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segment];
    CGFloat width = 400;
    CGFloat height = 400;
    self.imageCount = 3;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, width, height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(width * (self.imageCount + 2), height);
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    for (int i = 1; i < self.imageCount + 2; i++) {
        int index;
        if (i == 1) {
            index = self.imageCount;
        } else if (i == self.imageCount + 1) {
            index = 1;
        } else {
            index = i;
        }
        NSString* imageName = [NSString stringWithFormat:@"homeimage%d.jpg", index];
        UIImage* image = [UIImage imageNamed:imageName];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(width * (i - 1), 0, width, height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentOffset:CGPointMake(width, 0) animated:NO];
    [self.view addSubview:self.scrollView];
}
- (void) indexChange: (UISegmentedControl*) segment {
    if (segment.selectedSegmentIndex == 0) {
        [self.scrollView setContentOffset:CGPointMake(400, 0) animated:YES];
    }
    if (segment.selectedSegmentIndex == 1) {
        [self.scrollView setContentOffset:CGPointMake(400 * 2, 0) animated:YES];
    }
    if (segment.selectedSegmentIndex == 2) {
        [self.scrollView setContentOffset:CGPointMake(400 * 3, 0) animated:YES];
    }
}

- (void) autoScroll {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 400;
    int currentPage = offsetX / pageWidth;
    int nextPage = currentPage + 1;
    
    [self.scrollView setContentOffset:CGPointMake(nextPage * pageWidth, 0) animated:YES];
}
//监听滑到的位置然后进行判断
- (void)adjustIfNeeded {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageWidth = 400;
    int currentPage = offsetX / pageWidth;
    if (currentPage == 0) {
        [self.scrollView setContentOffset:CGPointMake(pageWidth * self.imageCount, 0) animated:NO];
        currentPage = self.imageCount;
    } else if (currentPage == self.imageCount + 1) {
        [self.scrollView setContentOffset:CGPointMake(pageWidth, 0) animated:NO];
        currentPage = 1;
    }
    [self updateSegmentForPage: currentPage];
}
- (void) updateSegmentForPage:(NSInteger)page {
    self.segment.selectedSegmentIndex = page - 1;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self adjustIfNeeded];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self adjustIfNeeded];
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
