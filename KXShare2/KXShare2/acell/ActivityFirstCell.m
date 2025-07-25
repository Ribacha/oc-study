//
//  ActivityFirstCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/24.
//

#import "ActivityFirstCell.h"

@implementation ActivityFirstCell

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
        iconView.image = [UIImage imageNamed:@"main_img3"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(18, 180, 370, 20)];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"下厨也要美美的，从一条围裙开始-六月鲜围裙创意设计大赛";
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textColor = [UIColor labelColor];
        [self.contentView addSubview:label];
        
    }
    return self;
}

@end
