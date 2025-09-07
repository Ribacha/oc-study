//
//  MyPersonCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/24.
//

#import "MyPersonCell.h"

@implementation MyPersonCell

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
        UIImageView* iconView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 130, 130)];
        iconView.image = [UIImage imageNamed:@"sixin_img1"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(160, 30, 160, 30)];
        label.text = @"share小白";
        label.font = [UIFont boldSystemFontOfSize:24];
        label.textColor = [UIColor labelColor];
        [self.contentView addSubview:label];
        UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 70, 200, 15)];
        label2.text = @"数媒/设计爱好者";
        label2.font = [UIFont boldSystemFontOfSize:12];
        label2.textColor = [UIColor labelColor];
        [self.contentView addSubview:label2];
        UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(160, 100, 270, 15)];
        label3.text = @"开心了就笑，不开心了就过会儿再笑";
        label3.font = [UIFont boldSystemFontOfSize:15];
        label3.textColor = [UIColor labelColor];
        [self.contentView addSubview:label3];
        
        UIImageView* iconView4 = [[UIImageView alloc] initWithFrame:CGRectMake(160, 140, 25, 25)];
        iconView4.image = [UIImage imageNamed:@"蓝心"];
        iconView4.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView4];
        UILabel* label7 = [[UILabel alloc] initWithFrame:CGRectMake(190, 145, 40, 16)];
        label7.text = @"0";
        label7.font = [UIFont boldSystemFontOfSize:14];
        label7.textColor = [UIColor labelColor];
        [self.contentView addSubview:label7];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView* iconView2 = [[UIImageView alloc] initWithFrame:CGRectMake(235, 140, 25, 25)];
        iconView2.image = [UIImage imageNamed:@"眼睛"];
        iconView2.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView2];
        UILabel* label5 = [[UILabel alloc] initWithFrame:CGRectMake(265, 145, 40, 16)];
        label5.text = @"6";
        label5.font = [UIFont boldSystemFontOfSize:14];
        label5.textColor = [UIColor labelColor];
        [self.contentView addSubview:label5];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView* iconView3 = [[UIImageView alloc] initWithFrame:CGRectMake(310, 140, 25, 25)];
        iconView3.image = [UIImage imageNamed:@"叠层"];
        iconView3.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView3];
        UILabel* label6 = [[UILabel alloc] initWithFrame:CGRectMake(340, 145, 40, 16)];
        label6.text = @"2";
        label6.font = [UIFont boldSystemFontOfSize:14];
        label6.textColor = [UIColor labelColor];
        [self.contentView addSubview:label6];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
@end
