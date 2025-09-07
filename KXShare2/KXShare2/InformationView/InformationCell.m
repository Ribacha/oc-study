//
//  InformationCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/29.
//

// InformationCell.m
#import "InformationCell.h"

@implementation InformationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 19, 16, 16)];
        [self.contentView addSubview:self.iconView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 15, 200, 24)];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

@end
