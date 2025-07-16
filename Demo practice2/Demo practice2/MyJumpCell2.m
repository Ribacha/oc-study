//
//  MyJumpCell2.m
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import "MyJumpCell2.h"

@implementation MyJumpCell2

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
        self.label.text = @"名字";
        [self.contentView addSubview:self.label];
        
        
        self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 25, 200, 30)];
        self.label2.text = @"lilililalila";
        [self.contentView addSubview:self.label2];
    }
    return self;
}

@end
