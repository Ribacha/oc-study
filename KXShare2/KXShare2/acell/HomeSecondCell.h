//
//  HomeSecondCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeSecondCell : UITableViewCell
@property (nonatomic, strong) UIButton* likeButton2;
@property (nonatomic, strong) MyModel* model;
@property (nonatomic, strong) UILabel *likeCountLabel1;
@property (nonatomic, copy) void (^likeButtonAction) (void);
- (void) configureWithModel:(MyModel*) model;
@end

NS_ASSUME_NONNULL_END

