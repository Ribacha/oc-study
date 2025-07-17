//
//  MyLabelCell.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import "MyLabelCell.h"

@implementation MyLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setLabelData:(NSArray *)labelData {
    _labelData = labelData;
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat itemHeight = 70;
    CGFloat padding = 10;
    for (int i = 0; i < labelData.count; i++) {
        NSDictionary* pic = labelData[i];
        
        UIView* labelpic = [[UIView alloc] initWithFrame:CGRectMake(0, i * itemHeight, self.contentView.bounds.size.width, itemHeight)];
        UIImageView* coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(padding, 15, 25, 25)];
        coverImage.image = [UIImage imageNamed:pic[@"cover"]];
        coverImage.contentMode = UIViewContentModeScaleAspectFit;
        coverImage.clipsToBounds = YES;
        [labelpic addSubview:coverImage];
        
        CGFloat labelX = CGRectGetMaxX(coverImage.frame) + 20;
        CGFloat labelWidth = self.contentView.bounds.size.width - labelX - 20;
        UILabel* labelName = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 20, labelWidth, 20)];
        labelName.text = pic[@"label"];
        labelName.font = [UIFont boldSystemFontOfSize:16];
        [labelpic addSubview:labelName];
        
        [self.contentView addSubview:labelpic];
    }
}
@end
