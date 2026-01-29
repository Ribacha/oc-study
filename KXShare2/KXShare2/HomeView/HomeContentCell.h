//
//  HomeContentCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/9/9.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeContentCell : UITableViewCell

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UILabel *likeCountLabel;
@property (nonatomic, copy) void (^likeButtonAction)(void);

- (void)configureWithModel:(MyModel *)model;

@end

NS_ASSUME_NONNULL_END
