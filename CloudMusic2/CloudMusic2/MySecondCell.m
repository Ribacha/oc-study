//
//  MySecondCell.m
//  CloudMusic
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import "MySecondCell.h"

@interface MySecondCell () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@end
@implementation MySecondCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupScrollView];
        [self setupPageControl];
    }
    return self;
}
- (void) setupScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.contentView addSubview:self.scrollView];
}

- (void) setupPageControl {
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.currentPage = 0;
    [self.contentView addSubview:self.pageControl];
}
- (void) layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 150);
    self.pageControl.frame = CGRectMake(0, 150, self.contentView.bounds.size.width, 20);
}
- (void)setupScrollViewWithImages {
    CGFloat width = self.contentView.bounds.size.width;
    CGFloat height = 150;
    
    NSArray* imageNames = @[@"home7", @"home6", @"home5", @"home4"];
    
    CGFloat imageWidth = 120;
    CGFloat imageHeight = 138;
    CGFloat margin = 10;
    
    for (int i = 0; i < imageNames.count; i++) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNames[i]]];
        imageView.frame = CGRectMake(i * (imageWidth + margin) + margin, 15, imageWidth, imageHeight);
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 8; // 圆角
        [self.scrollView addSubview:imageView];
    }
    
    CGFloat contentWidth = imageNames.count * (imageWidth + margin) + margin;
    self.scrollView.contentSize = CGSizeMake(contentWidth, height);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pagewidth = scrollView.frame.size.width;
    NSInteger currentPage = (scrollView.contentOffset.x + pagewidth / 2) / pagewidth;
    self.pageControl.currentPage = currentPage;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
