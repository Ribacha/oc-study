//
//  SetThirdCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "SetThirdCell.h"

@implementation SetThirdCell

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
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(60, 14, 80, 30)];
        label.text = @"消息设置";
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
