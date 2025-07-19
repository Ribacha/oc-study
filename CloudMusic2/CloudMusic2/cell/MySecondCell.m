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
    self.scrollView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 200);
//    self.pageControl.frame = CGRectMake(0, 170, self.contentView.bounds.size.width, 0);
}
- (void)setupScrollViewWithImages {
    CGFloat width = self.contentView.bounds.size.width;
    CGFloat height = 180;  // 增加高度容纳 label
    
    NSArray* imageNames = @[@"home7", @"home6", @"home5", @"home4"];
    NSArray* labels = @[@"精选推荐", @"每日歌曲", @"私人FM", @"歌单推荐"];  // 对应的文字
    
    CGFloat imageWidth = 120;
    CGFloat imageHeight = 150;
    CGFloat margin = 20;
    CGFloat labelHeight = 20;
    
    for (int i = 0; i < imageNames.count; i++) {
        CGFloat x = i * (imageWidth + margin) + margin;
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNames[i]]];
        imageView.frame = CGRectMake(x, 15, imageWidth, imageHeight);
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 8;
        [self.scrollView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, CGRectGetMaxY(imageView.frame) + 5, imageWidth, labelHeight)];
        label.text = labels[i];
        label.font = [UIFont systemFontOfSize:13 weight:UIFontWeightMedium];
        label.textColor = [UIColor labelColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.scrollView addSubview:label];
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
