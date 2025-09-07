//
//  VCMyClass.h
//  CloudMusic
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import <UIKit/UIKit.h>
#import "ProfileModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface VCMyClass : UIViewController
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) ProfileModel *profileModel;
@property (nonatomic, copy) NSString *currentAvatarName;
@end

NS_ASSUME_NONNULL_END
