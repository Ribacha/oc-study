//
//  ActivityCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/31.
//

// ActivityCell.h
#import <UIKit/UIKit.h>

@interface ActivityCell : UITableViewCell
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
- (void)configureWithImage:(NSString *)imageName title:(NSString *)title;
@end
