//
//  MessagePeopleCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/29.
//

// MessagePeopleCell.h
#import <UIKit/UIKit.h>

@interface MessagePeopleCell : UITableViewCell
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

- (void)configureWithIcon:(NSString *)iconName
                    title:(NSString *)title
                   detail:(NSString *)detail;
@end
