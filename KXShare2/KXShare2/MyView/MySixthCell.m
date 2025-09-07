//
//  MySixthCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "MySixthCell.h"

@implementation MySixthCell

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
        UIImageView* iconView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 16, 16)];
        iconView.image = [UIImage imageNamed:@"6"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(60, 14, 80, 30)];
        label.text = @"退出";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label];
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(330, 19, 16, 16);
        UIImage *playImage = [UIImage systemImageNamed:@"play.fill"];
        [button setImage:playImage forState:UIControlStateNormal];
        button.tintColor = [UIColor blueColor];
        [self.contentView addSubview:button];
    }
    return self;
}

@end
