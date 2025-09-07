//
//  UserModel.m
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import "UserModel.h"

@implementation UserModel
- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    if (self = [super init]) {
        _username = username;
        _password = password;
    }
    return self;
}
@end
