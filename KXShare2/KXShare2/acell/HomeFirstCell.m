//
//  HomeFirstCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "HomeFirstCell.h"

@interface HomeFirstCell () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, strong) NSArray* displayImages;
@end

@implementation HomeFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupScrollView];
    }
    return self;
}

- (void) setupScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.scrollView];
    [self.contentView addSubview:self.pageControl];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = self.contentView.bounds;
    self.pageControl.frame = CGRectMake(0, self.contentView.bounds.size.height - 20, self.contentView.bounds.size.width, 20);
    [self reloadImages];
}
- (void)setImageNames:(NSArray *)imageNames {
    _imageNames = imageNames;
    
    if (_imageNames.count == 0) {
        return;
    }
    
    NSMutableArray *temp = [NSMutableArray arrayWithArray:imageNames];
    [temp insertObject:imageNames.lastObject atIndex:0];
    [temp addObject:imageNames.firstObject];
    self.displayImages = temp;
    
    [self reloadImages];
    [self startTimer];
}

- (void)reloadImages {
    if (self.displayImages.count == 0) {
        return;
    }
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat width = self.contentView.bounds.size.width;
    CGFloat height = self.contentView.bounds.size.height;
    
    for (NSInteger i = 0; i < self.displayImages.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.displayImages[i]]];
        imageView.frame = CGRectMake(i * width, 0, width, height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.displayImages.count * width, height);
    [self.scrollView setContentOffset:CGPointMake(width, 0)];
    self.pageControl.numberOfPages = self.imageNames.count;
    self.pageControl.currentPage = 0;
}

- (void)startTimer {
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
}

- (void)autoScroll {
    CGFloat width = self.contentView.bounds.size.width;
    CGPoint offset = self.scrollView.contentOffset;
    CGPoint newOffset = CGPointMake(offset.x + width, 0);
    [self.scrollView setContentOffset:newOffset animated:YES];
    [self adjustScrollViewOffset];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self adjustScrollViewOffset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self startTimer];
    [self adjustScrollViewOffset];
}

- (void)adjustScrollViewOffset {
    CGFloat width = self.contentView.bounds.size.width;
    NSInteger currentPage = self.scrollView.contentOffset.x / width;
    NSInteger pageCount = self.displayImages.count;
    if (currentPage == 0) {
        self.scrollView.contentOffset = CGPointMake((self.displayImages.count - 2) * width, 0);
        currentPage = pageCount - 2;
    } else if (currentPage == self.displayImages.count - 1) {
        self.scrollView.contentOffset = CGPointMake(width, 0);
        currentPage = 1;
    }
    self.pageControl.currentPage = currentPage - 1;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}
@end
