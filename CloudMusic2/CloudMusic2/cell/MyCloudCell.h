//
//  MyCloudCell.h
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import <UIKit/UIKit.h>
#import "MyContentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyCloudCell : UITableViewCell
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UILabel *extraInfoLabel;

- (void)configureWithModel:(MyContentModel *)model;
@end

NS_ASSUME_NONNULL_END
