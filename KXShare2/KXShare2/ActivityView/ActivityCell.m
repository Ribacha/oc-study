//
//  ActivityCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/31.
//

// ActivityCell.m
#import "ActivityCell.h"

@implementation ActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(18, 0, 370, 180)];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.iconView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 180, 370, 20)];
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        self.titleLabel.textColor = [UIColor labelColor];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)configureWithImage:(NSString *)imageName title:(NSString *)title {
    self.iconView.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = title;
}

@end
