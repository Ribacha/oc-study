//
//  UserModel.h
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject
@property NSString *username;
@property NSString *password;
- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
