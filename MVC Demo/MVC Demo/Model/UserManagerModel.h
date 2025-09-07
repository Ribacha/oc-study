//
//  UserManagerModel.h
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserManagerModel : NSObject
@property (nonatomic, strong) NSMutableArray<UserModel *> *users;
- (instancetype)init;
- (BOOL)registerUser:(UserModel *)user;
- (BOOL)loginWithUsername:(NSString *)username password:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
