//
//  MyCloudCell.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import "MyCloudCell.h"

@implementation MyCloudCell

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
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 10, 200, 20)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 200, 15)];
        _subtitleLabel.font = [UIFont systemFontOfSize:12];
        _subtitleLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_subtitleLabel];
    }
    return self;
}

- (void)configureWithModel:(MyContentModel *)model {
    self.titleLabel.text = model.title;
    self.subtitleLabel.text = model.subtitle;
    
    
    self.extraInfoLabel.text = model.extraInfo;
    self.extraInfoLabel.hidden = (model.extraInfo.length == 0);
}
@end
