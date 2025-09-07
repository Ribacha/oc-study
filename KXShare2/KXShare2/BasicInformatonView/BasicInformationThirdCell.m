//
//  BasicInformationThirdCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "BasicInformationThirdCell.h"

@implementation BasicInformationThirdCell

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
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 40, 30)];
        label.text = @"签名";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label];
        
        UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, 300, 30)];
        label2.text = @" 开心了就笑，不开心了就过会儿再笑";
        label2.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label2];
    }
    return self;
}
@end
