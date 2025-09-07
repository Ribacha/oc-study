//
//  ArticleCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/28.
//

// ArticleCell.m
#import "ArticleCell.h"

@interface ArticleCell()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UIImageView *likeIcon;
@property (nonatomic, strong) UILabel *likeCount;
@property (nonatomic, strong) UIImageView *viewIcon;
@property (nonatomic, strong) UILabel *viewCount;
@property (nonatomic, strong) UIImageView *shareIcon;
@property (nonatomic, strong) UILabel *shareCount;
@end

@implementation ArticleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 170, 160)];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.iconView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 30, 100, 20)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.titleLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 65, 200, 15)];
        self.typeLabel.font = [UIFont boldSystemFontOfSize:14];
        self.typeLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.typeLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 85, 70, 15)];
        self.timeLabel.font = [UIFont boldSystemFontOfSize:14];
        self.timeLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.timeLabel];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 30, 112, 15)];
        self.authorLabel.font = [UIFont boldSystemFontOfSize:16];
        self.authorLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.authorLabel];
        
        self.likeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(190, 140, 16, 16)];
        [self.contentView addSubview:self.likeIcon];
        self.likeCount = [[UILabel alloc] initWithFrame:CGRectMake(220, 140, 40, 16)];
        self.likeCount.font = [UIFont boldSystemFontOfSize:14];
        [self.contentView addSubview:self.likeCount];
        
        self.viewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(250, 140, 16, 16)];
        [self.contentView addSubview:self.viewIcon];
        self.viewCount = [[UILabel alloc] initWithFrame:CGRectMake(270, 140, 40, 16)];
        self.viewCount.font = [UIFont boldSystemFontOfSize:14];
        [self.contentView addSubview:self.viewCount];
        
        self.shareIcon = [[UIImageView alloc] initWithFrame:CGRectMake(305, 140, 16, 16)];
        [self.contentView addSubview:self.shareIcon];
        self.shareCount = [[UILabel alloc] initWithFrame:CGRectMake(330, 140, 40, 16)];
        self.shareCount.font = [UIFont boldSystemFontOfSize:14];
        [self.contentView addSubview:self.shareCount];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)configureWithData:(NSDictionary *)data {
    self.iconView.image = [UIImage imageNamed:data[@"icon"]];
    self.titleLabel.text = data[@"title"];
    self.typeLabel.text = data[@"type"];
    self.timeLabel.text = data[@"time"];
    self.authorLabel.text = data[@"author"];
    
    self.likeIcon.image = [UIImage imageNamed:@"蓝心"];
    self.likeCount.text = [NSString stringWithFormat:@"%@", data[@"likes"]];
    
    self.viewIcon.image = [UIImage imageNamed:@"眼睛"];
    self.viewCount.text = [NSString stringWithFormat:@"%@", data[@"views"]];
    
    self.shareIcon.image = [UIImage imageNamed:@"分享"];
    self.shareCount.text = [NSString stringWithFormat:@"%@", data[@"shares"]];
}

@end
