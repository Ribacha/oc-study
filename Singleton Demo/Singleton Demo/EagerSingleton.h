//
//  EagerSingleton.h
//  Singleton Demo
//
//  Created by 开开心心的macbook air on 2025/9/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EagerSingleton : NSObject<NSCopying, NSMutableCopying>
+ (instancetype) sharedInstance;
@property (nonatomic, strong) NSString *info;
@end

NS_ASSUME_NONNULL_END
