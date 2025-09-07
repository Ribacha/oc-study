//
//  DetailCell2.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/23.
//

#import "DetailCell2.h"

@implementation DetailCell2

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
        UIImageView* iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 170, 160)];
        iconView.image = [UIImage imageNamed:@"list_img2"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(190, 30, 200, 20)];
        label.text = @"每个人都需要一个大白";
        label.font = [UIFont boldSystemFontOfSize:20];
        label.textColor = [UIColor labelColor];
        [self.contentView addSubview:label];
        UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(190, 70, 200, 15)];
        label2.text = @"原创作品-摄影";
        label2.font = [UIFont boldSystemFontOfSize:14];
        label2.textColor = [UIColor labelColor];
        [self.contentView addSubview:label2];
        UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(190, 85, 70, 15)];
        label3.text = @"15分钟前";
        label3.font = [UIFont boldSystemFontOfSize:14];
        label3.textColor = [UIColor labelColor];
        [self.contentView addSubview:label3];
        UILabel* label4 = [[UILabel alloc] initWithFrame:CGRectMake(190, 50, 112, 15)];
        label4.text = @"share小王";
        label4.font = [UIFont boldSystemFontOfSize:16];
        label4.textColor = [UIColor labelColor];
        [self.contentView addSubview:label4];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView* iconView4 = [[UIImageView alloc] initWithFrame:CGRectMake(190, 140, 16, 16)];
        iconView4.image = [UIImage imageNamed:@"蓝心"];
        iconView4.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView4];
        UILabel* label7 = [[UILabel alloc] initWithFrame:CGRectMake(220, 140, 40, 16)];
        label7.text = @"0";
        label7.font = [UIFont boldSystemFontOfSize:14];
        label7.textColor = [UIColor labelColor];
        [self.contentView addSubview:label7];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView* iconView2 = [[UIImageView alloc] initWithFrame:CGRectMake(250, 140, 16, 16)];
        iconView2.image = [UIImage imageNamed:@"眼睛"];
        iconView2.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView2];
        UILabel* label5 = [[UILabel alloc] initWithFrame:CGRectMake(270, 140, 40, 16)];
        label5.text = @"6";
        label5.font = [UIFont boldSystemFontOfSize:14];
        label5.textColor = [UIColor labelColor];
        [self.contentView addSubview:label5];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView* iconView3 = [[UIImageView alloc] initWithFrame:CGRectMake(305, 140, 16, 16)];
        iconView3.image = [UIImage imageNamed:@"分享"];
        iconView3.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView3];
        UILabel* label6 = [[UILabel alloc] initWithFrame:CGRectMake(330, 140, 40, 16)];
        label6.text = @"2";
        label6.font = [UIFont boldSystemFontOfSize:14];
        label6.textColor = [UIColor labelColor];
        [self.contentView addSubview:label6];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
@end
