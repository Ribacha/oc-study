//
//  LazyGcdSingleton.m
//  Singleton Demo
//
//  Created by 开开心心的macbook air on 2025/9/8.
//
//懒汉式GCD写法
#import "LazyGcdSingleton.h"
static id _instance = nil;
@implementation LazyGcdSingleton
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [LazyGcdSingleton sharedInstance];
}
- (id)copyWithZone:(NSZone *)zone {
    return [LazyGcdSingleton sharedInstance];
}
- (id) mutableCopyWithZone:(NSZone *)zone {
    return [LazyGcdSingleton sharedInstance];
}
- (instancetype)init {
    _ok = @"ok";
    return self;
}
@end
