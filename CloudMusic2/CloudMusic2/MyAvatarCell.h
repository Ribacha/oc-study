//
//  MyAvatarCell.h
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/16.
//

#import <UIKit/UIKit.h>
#import "ProfileModel.h"
NS_ASSUME_NONNULL_BEGIN
@class MyAvatarCell;
@protocol MyAvatarCellDelegate <NSObject>
- (void) avatarCellDidTapAvatar: (MyAvatarCell* ) cell;
@end

@interface MyAvatarCell : UITableViewCell
@property (nonatomic, weak) id<MyAvatarCellDelegate> delegate;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *vipLabel;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *bioLabel;
@property (nonatomic, strong) UIButton *statusButton;
@property (nonatomic, strong) UIView *statsView;
@property (nonatomic, strong) UIView *badgeView;
@property (nonatomic, strong) UILabel *badgeDescLabel;
- (void)configureWithModel:(ProfileModel *)model;
@end

NS_ASSUME_NONNULL_END
