//
//  UserManagerModel.m
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import "UserManagerModel.h"

@implementation UserManagerModel
- (instancetype)init {
    if (self = [super init]) {
        self.users = [NSMutableArray array];
    }
    return self;
}
- (BOOL)registerUser:(UserModel *)user {
    for (UserModel *u in self.users) {
        if ([u.username isEqualToString:user.username]) {
            return NO;
        }
    }
    [self.users addObject:user];
    return YES;
}
- (BOOL)loginWithUsername:(NSString *)username password:(NSString *)password {
    for (UserModel *u in self.users) {
        if ([u.username isEqualToString:username] && [u.password isEqualToString:password]) {
            return YES;
        }
    }
    return NO;
}
@end
