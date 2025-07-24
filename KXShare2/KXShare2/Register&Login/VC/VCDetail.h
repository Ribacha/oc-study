//
//  VCDetail.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/22.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface VCDetail : UIViewController
@property (nonatomic, strong) MyModel* model;

@property (nonatomic, copy) void(^likeStatusChanged)(void);
- (instancetype)initWithModel:(MyModel*)model;
@end

NS_ASSUME_NONNULL_END
