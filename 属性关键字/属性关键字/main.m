//
//  main.m
//  属性关键字
//
//  Created by 开开心心的macbook air on 2025/9/7.
//

#import <Foundation/Foundation.h>
#import "Person1.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person1 *p1 = [[Person1 alloc] init];
        NSMutableString *s1 = [NSMutableString stringWithString:@"Apple"];
        p1.name = s1;
        [s1 appendString:@"Android"];
        NSLog(@"%@", p1.name);
    }
    return 0;
}
