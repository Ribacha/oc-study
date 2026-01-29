//
//  LazyGcdSingleton.h
//  Singleton Demo
//
//  Created by 开开心心的macbook air on 2025/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LazyGcdSingleton : NSObject<NSCopying, NSMutableCopying>
+ (instancetype) sharedInstance;
@property (nonatomic, strong) NSString* ok;
@end

NS_ASSUME_NONNULL_END
