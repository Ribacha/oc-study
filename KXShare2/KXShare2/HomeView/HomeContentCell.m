//
//  HomeContentCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/9/9.
//

#import "HomeContentCell.h"

@interface HomeContentCell ()
@property (nonatomic, strong) UIImageView *iconView;   // 主图
@property (nonatomic, strong) UILabel *titleLabel;     // 标题
@property (nonatomic, strong) UILabel *subtitleLabel;  // 副标题
@property (nonatomic, strong) UILabel *authorLabel;    // 作者
@property (nonatomic, strong) UILabel *timeLabel;      // 时间
@property (nonatomic, strong) UIImageView *viewIcon;   // 眼睛图标
@property (nonatomic, strong) UILabel *viewCountLabel; // 浏览数
@property (nonatomic, strong) UIImageView *shareIcon;  // 分享图标
@property (nonatomic, strong) UILabel *shareCountLabel;// 分享数
@end

@implementation HomeContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 170, 160)];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.iconView];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 30, 100, 20)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.titleLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.titleLabel];

        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 65, 200, 15)];
        self.subtitleLabel.font = [UIFont systemFontOfSize:14];
        self.subtitleLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.subtitleLabel];

        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 85, 100, 15)];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = [UIColor secondaryLabelColor];
        [self.contentView addSubview:self.timeLabel];

        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 30, 120, 15)];
        self.authorLabel.font = [UIFont boldSystemFontOfSize:16];
        self.authorLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.authorLabel];

        self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.likeButton addTarget:self action:@selector(likeButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        self.likeButton.frame = CGRectMake(190, 140, 16, 16);
        [self.contentView addSubview:self.likeButton];

        self.likeCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 140, 40, 16)];
        self.likeCountLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.likeCountLabel];

        self.viewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(250, 140, 16, 16)];
        self.viewIcon.image = [UIImage imageNamed:@"眼睛"];
        self.viewIcon.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.viewIcon];

        self.viewCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 140, 40, 16)];
        self.viewCountLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.viewCountLabel];

        self.shareIcon = [[UIImageView alloc] initWithFrame:CGRectMake(305, 140, 16, 16)];
        self.shareIcon.image = [UIImage imageNamed:@"分享"];
        self.shareIcon.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.shareIcon];

        self.shareCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(330, 140, 40, 16)];
        self.shareCountLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.shareCountLabel];
    }
    return self;
}

- (void)configureWithModel:(MyModel *)model {
    self.iconView.image = [UIImage imageNamed:model.imageName];
    self.titleLabel.text = model.title;
    self.subtitleLabel.text = model.subtitle;
    self.authorLabel.text = model.author;
    self.timeLabel.text = model.time;

    NSString *likeImage = model.isLiked ? @"红心" : @"蓝心";
    [self.likeButton setImage:[UIImage imageNamed:likeImage] forState:UIControlStateNormal];
    self.likeCountLabel.text = [NSString stringWithFormat:@"%ld", (long)model.likeCount];

    self.viewCountLabel.text = [NSString stringWithFormat:@"%ld", (long)model.viewCount];
    self.shareCountLabel.text = [NSString stringWithFormat:@"%ld", (long)model.shareCount];
}

- (void)likeButtonTapped {
    if (self.likeButtonAction) {
        self.likeButtonAction();
    }
}

@end
