//
//  MyNextCell.m
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import "MyNextCell.h"

@implementation MyNextCell

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
        self.tableImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12, 24, 24)];
        [self.contentView addSubview:self.tableImage];
        
        self.tablelabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 200, 28)];
        [self.contentView addSubview:self.tablelabel];
    }
    return self;
}
@end
