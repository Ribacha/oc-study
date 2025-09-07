//
//  BasicInformationFirstCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "BasicInformationFirstCell.h"

@implementation BasicInformationFirstCell

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
        UIImageView* iconView = [[UIImageView alloc] initWithFrame:CGRectMake(70, 20, 70, 70)];
        iconView.image = [UIImage imageNamed:@"a2"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 40, 30)];
        label.text = @"头像";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label];
    }
    return self;
}
@end
