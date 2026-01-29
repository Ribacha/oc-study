//
//  LazyLockSingleton.m
//  Singleton Demo
//
//  Created by 开开心心的macbook air on 2025/9/9.
//
//懒汉式互斥锁写法
#import "LazyLockSingleton.h"
static id _instance = nil;
@implementation LazyLockSingleton
+ (instancetype)sharedInstance {
    if (_instance == nil) {
        @synchronized (self) {
            if (_instance == nil) {
                _instance = [[super alloc] init];
            }
        }
    }
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_instance == nil) {
        @synchronized (self) {
            if (_instance == nil) {
                _instance = [super allocWithZone:zone];
            }
        }
    }
    return _instance;
}
- (id) copyWithZone:(NSZone *)zone {
    return [LazyLockSingleton sharedInstance];
}
- (id) mutableCopyWithZone:(NSZone *)zone {
    return [LazyLockSingleton sharedInstance];
}
@end
