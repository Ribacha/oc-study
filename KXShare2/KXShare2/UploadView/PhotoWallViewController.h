//
//  PhotoWallViewController.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoWallViewController : UITableViewController
@property (nonatomic, copy) void (^selectedImagesCallback)(NSArray* selectedImages);
@end

NS_ASSUME_NONNULL_END
