//
//  ChatCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/26.
//

// ChatCell.h
#import <UIKit/UIKit.h>

@interface ChatCell : UITableViewCell
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;

- (void)setMessage:(NSString *)message isSender:(BOOL)isSender time:(NSString *)timeString;
@end
