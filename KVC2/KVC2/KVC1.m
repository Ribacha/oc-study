//
//  KVC1.m
//  KVC2
//
//  Created by 开开心心的macbook air on 2025/9/26.
//

#import "KVC1.h"

@implementation KVC1
//+ (BOOL)accessInstanceVariablesDirectly {
//    return NO;
//}
//- (int) getAge {
//    return 1222;
//}
//- (int) age {
//    return 120;
//}
//- (int) isAge {
//    return 10;
//}
//+ (BOOL)accessInstanceVariablesDirectly {
//    return NO;
//}
//- (id)valueForUndefinedKey:(NSString *)key {
//    NSLog(@"出现异常");
//    return nil;
//}
//- (void)setValue:(id)value forKey:(NSString *)key {
//    NSLog(@"出现异常，无法设置");
//}
- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"age"]) {
            NSLog(@"警告：不能将 nil 赋值给 age，已设置为默认值 0");
            self.age = 0;
        } else {
            [super setNilValueForKey:key];
        }
}
- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"警告：尝试访问一个不存在的 key '%@'", key);
    return nil;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"警告：尝试为不存在的 key '%@' 设置值 '%@'", key, value);
}
@end
