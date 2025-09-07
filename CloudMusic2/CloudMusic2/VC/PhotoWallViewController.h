//
//  PhotoWallViewController.h
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import <UIKit/UIKit.h>
#import "MyAvatarCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface PhotoWallViewController : UIViewController
@property (nonatomic, copy) void(^avatarSelectedHandler)(NSString *selectedAvatarName);

@end

NS_ASSUME_NONNULL_END
