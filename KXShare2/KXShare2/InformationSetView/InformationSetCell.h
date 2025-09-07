//
//  InformationSetCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/31.
//

// InformationSetCell.h
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InformationSetCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *actionButton;

- (void)configureWithTitle:(NSString *)title
                  atIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
