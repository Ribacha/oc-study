//
//  VCClassification.h
//  CloudMusic
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import <UIKit/UIKit.h>
#import "ProfileModel.h"
#import "MyAvatarCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface VCClassification : UIViewController
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) ProfileModel *profileModel;
@end

NS_ASSUME_NONNULL_END
