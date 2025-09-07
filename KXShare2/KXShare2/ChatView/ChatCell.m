//
//  ChatCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/26.
//

// ChatCell.m
#import "ChatCell.h"
#import "PaddingLabel.h"

@implementation ChatCell {
    UILabel *_timeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 头像
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 40, 40)];
        _avatarImageView.layer.cornerRadius = 20;
        _avatarImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatarImageView];
        
        // 气泡文字
        _messageLabel = [[PaddingLabel alloc] init];
        ((PaddingLabel *)_messageLabel).textInsets = UIEdgeInsetsMake(5, 15, 5, 15);
        _messageLabel.numberOfLines = 0;
        _messageLabel.font = [UIFont systemFontOfSize:16];
        _messageLabel.layer.cornerRadius = 10;
        _messageLabel.layer.masksToBounds = YES;
        [self.contentView addSubview:_messageLabel];

        // 时间标签
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_timeLabel];
    }
    return self;
}

// 新增方法，带时间设置
- (void)setMessage:(NSString *)message isSender:(BOOL)isSender time:(NSString *)timeString {
    _messageLabel.text = message;
    _timeLabel.text = timeString;

    CGSize textSize = [message boundingRectWithSize:CGSizeMake(220, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName: _messageLabel.font}
                                            context:nil].size;
    CGFloat bubbleW = textSize.width + 15 + 15;
    CGFloat bubbleH = textSize.height + 10 + 10;

    // 设置时间标签
    _timeLabel.frame = CGRectMake(0, 5, 395, 20);
    
    if (isSender) {
        // 右边头像
        _avatarImageView.frame = CGRectMake(350, 30, 40, 40);
        _avatarImageView.image = [UIImage imageNamed:@"img4"];
        // 气泡靠近头像左边
        CGFloat bubbleX = CGRectGetMinX(_avatarImageView.frame) - bubbleW - 10;
        _messageLabel.frame = CGRectMake(bubbleX, 30, bubbleW, bubbleH);
        _messageLabel.textAlignment = NSTextAlignmentRight;
        _messageLabel.backgroundColor = [UIColor colorWithRed:0.6 green:0.8 blue:1.0 alpha:1.0];
        _messageLabel.textColor = [UIColor blackColor];
    } else {
        // 左边头像
        _avatarImageView.frame = CGRectMake(10, 30, 40, 40);
        _avatarImageView.image = [UIImage imageNamed:@"img5"];
        // 气泡在头像右边
        _messageLabel.frame = CGRectMake(60, 30, bubbleW, bubbleH);
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        _messageLabel.backgroundColor = [UIColor lightGrayColor];
        _messageLabel.textColor = [UIColor whiteColor];
    }
}

@end
