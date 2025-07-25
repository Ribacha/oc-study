//
//  ActivitSecondCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/24.
//

#import "ActivitSecondCell.h"

@implementation ActivitSecondCell

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
        UIImageView* iconView = [[UIImageView alloc] initWithFrame:CGRectMake(18, 0, 370, 180)];
        iconView.image = [UIImage imageNamed:@"main_img2"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(24, 180, 358, 20)];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"MIUI主题市场让你的创意改变世界！";
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textColor = [UIColor labelColor];
        [self.contentView addSubview:label];
        
    }
    return self;
}
@end
