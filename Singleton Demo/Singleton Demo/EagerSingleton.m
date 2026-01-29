//
//  EagerSingleton.m
//  Singleton Demo
//
//  Created by 开开心心的macbook air on 2025/9/9.
//
//饿汉式写法
#import "EagerSingleton.h"
static EagerSingleton*  _instance;
@implementation EagerSingleton
+ (void)load {
    _instance = [[self alloc] init];
    _instance.info = @"111";
}
+ (instancetype)sharedInstance {
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (!_instance) {
        _instance = [super allocWithZone:zone];
    }
    return _instance;
}
- (id) copyWithZone:(NSZone *)zone {
    return _instance;
}
- (id) mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}
@end
