//
//  MyTollCell.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/16.
//

#import "MyTollCell.h"
@interface MyTollCell ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@end;

@implementation MyTollCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupPagecontrol];
        [self setupScrolliView];
    }
    return self;
}

- (void) setupScrolliView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.contentView addSubview:self.scrollView];
}
- (void) setupPagecontrol {
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.currentPage = 0;
    [self.contentView addSubview:self.pageControl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 80);
    self.pageControl.frame = CGRectMake(0, 80, self.contentView.bounds.size.width, 15);
}
- (void)setupScrollViewWithImages {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    CGFloat width = self.contentView.bounds.size.width;
    CGFloat height = 80; // 拉高以容纳 label
    NSArray* imageNames = @[@"创作",@"歌词",@"衣服,服装",@"星星",@"麦克风2",@"云朵-copy"];
    NSArray* labels = @[@"创作", @"歌词", @"服装", @"收藏", @"MIC", @"云盘"];
    
    CGFloat imageWidth = 35;
    CGFloat imageHeight = 35;
    CGFloat margin = 30;
    CGFloat labelHeight = 20;
    
    for (int i = 0; i < imageNames.count; i++) {
        CGFloat x = i * (imageWidth + margin) + margin;
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNames[i]]];
        imageView.frame = CGRectMake(x, 10, imageWidth, imageHeight);
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 8;
        [self.scrollView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, CGRectGetMaxY(imageView.frame) + 5, imageWidth, labelHeight)];
        label.text = labels[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor labelColor];
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
@end
