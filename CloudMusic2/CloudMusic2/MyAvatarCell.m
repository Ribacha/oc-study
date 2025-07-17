//
//  MyAvatarCell.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/16.
//

#import "MyAvatarCell.h"
#import"ProfileModel.h"
@implementation MyAvatarCell

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
        [self setupViews];
        
    }
    
    return self;
}
- (void) setupViews {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //头像
    _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(155, -20, 90, 90)];
        _avatarImageView.layer.cornerRadius = 45;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _avatarImageView.layer.borderWidth = 2.0;
        _avatarImageView.userInteractionEnabled = YES;
        [_avatarImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarTapped:)]];//下面的函数是他点击后的响应函数
        [self.contentView addSubview:_avatarImageView];
        
        // VIP标签
        _vipLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 70, 60, 25)];
        _vipLabel.textColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.2 alpha:1.0];
        _vipLabel.font = [UIFont boldSystemFontOfSize:20];
        _vipLabel.textAlignment = NSTextAlignmentCenter;
        _vipLabel.backgroundColor = [UIColor labelColor];
        _vipLabel.layer.cornerRadius = 12;
        _vipLabel.layer.masksToBounds = YES;
        [self.contentView addSubview:_vipLabel];
        
        // 用户名
        _usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 80, self.contentView.bounds.size.width, 30)];
        _usernameLabel.textColor = [UIColor labelColor];
        _usernameLabel.font = [UIFont boldSystemFontOfSize:20];
        _usernameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_usernameLabel];
        
        // 个性签名
        _bioLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 110, self.contentView.bounds.size.width, 25)];
        _bioLabel.textColor = [UIColor labelColor];
        _bioLabel.font = [UIFont systemFontOfSize:20];
        _bioLabel.font = [UIFont boldSystemFontOfSize:20];
        _bioLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_bioLabel];
        // 统计数据视图
        _statsView = [[UIView alloc] initWithFrame:CGRectMake(80, 130, self.contentView.bounds.size.width - 60, 50)];
        [self.contentView addSubview:_statsView];
        
        // 徽章视图
        _badgeView = [[UIView alloc] initWithFrame:CGRectMake(100, 190, 250, 30)];
        _badgeView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.15];
        _badgeView.layer.cornerRadius = 10;
        [self.contentView addSubview:_badgeView];
        
        _badgeDescLabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 3, 300, 20)];
        _badgeDescLabel.textColor = [UIColor labelColor];
        _badgeDescLabel.font = [UIFont systemFontOfSize:14];
        [_badgeView addSubview:_badgeDescLabel];
    }

    #pragma mark - 配置数据
    - (void)configureWithModel:(ProfileModel *)model {
        _avatarImageView.image = [UIImage imageNamed:model.avatarName];
        _usernameLabel.text = model.username;
        _vipLabel.text = model.vipStatus;
        _bioLabel.text = model.bio;
        _badgeDescLabel.text = model.badgeDesc;
        
        // 清空 statsView 再重建
        [_statsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        CGFloat statWidth = _statsView.bounds.size.width / model.stats.count;
        for (int i = 0; i < model.stats.count; i++) {
            UILabel *statLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * statWidth, 0, statWidth, 50)];
            statLabel.text = model.stats[i];
            statLabel.numberOfLines = 2;
            statLabel.textColor = [UIColor labelColor];
            statLabel.font = [UIFont systemFontOfSize:15];
            statLabel.textAlignment = NSTextAlignmentCenter;
            [_statsView addSubview:statLabel];
        }
    }

    #pragma mark - 头像点击
    - (void)avatarTapped:(UITapGestureRecognizer *)gesture {
        NSLog(@"头像被点击");
        // 可通过代理/通知传递出去
        if ([self.delegate respondsToSelector:@selector(avatarCellDidTapAvatar:)]) {
            [self.delegate avatarCellDidTapAvatar:self];
        }
    }

    @end
