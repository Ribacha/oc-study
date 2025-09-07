//
//  MessagePeopleCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/29.
//

// MessagePeopleCell.m
#import "MessagePeopleCell.h"

@implementation MessagePeopleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
        self.iconView.layer.cornerRadius = 25;
        self.iconView.clipsToBounds = YES;
        [self.contentView addSubview:self.iconView];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 200, 20)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];

        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 45, 200, 15)];
        self.detailLabel.font = [UIFont systemFontOfSize:13];
        self.detailLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.detailLabel];
    }
    return self;
}

- (void)configureWithIcon:(NSString *)iconName
                    title:(NSString *)title
                   detail:(NSString *)detail {
    self.iconView.image = [UIImage imageNamed:iconName];
    self.titleLabel.text = title;
    self.detailLabel.text = detail;
}

@end
