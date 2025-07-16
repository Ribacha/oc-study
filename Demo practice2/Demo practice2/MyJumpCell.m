//
//  MyJumpCell.m
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import "MyJumpCell.h"

@implementation MyJumpCell

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
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, 200, 30)];
        self.label.text = @"头像";
        [self.contentView addSubview:self.label];
        
        
        self.MyimageView = [[UIImageView alloc] initWithFrame:CGRectMake(90, 10, 60, 60)];
        self.MyimageView.layer.cornerRadius = 30; // 一半宽高，做圆形
        self.MyimageView.clipsToBounds = YES; //裁剪多余部分
        self.MyimageView.image = [UIImage imageNamed:@"p1.jpg"];
        [self.contentView addSubview:self.MyimageView];
    }
    return self;
}

@end
