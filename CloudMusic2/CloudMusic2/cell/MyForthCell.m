//
//  MyForthCell.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/16.
//

#import "MyForthCell.h"

@implementation MyForthCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
        self.label.text = @"  >>根据你喜欢的歌曲推荐";
        [self.contentView addSubview:self.label];
    }
    return self;
}
@end
