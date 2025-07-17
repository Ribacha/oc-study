//
//  ProfileModel.h
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileModel : NSObject

@property (nonatomic, copy) NSString *avatarName;    // 本地图片名
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *vipStatus;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *badgeDesc;
@property (nonatomic, strong) NSArray<NSString *> *stats; 
@property (nonatomic, strong) NSArray<NSString *> *avatarList;
@end

NS_ASSUME_NONNULL_END
