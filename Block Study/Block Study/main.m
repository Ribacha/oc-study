//
//  main.m
//  Block Study
//
//  Created by 开开心心的macbook air on 2025/11/27.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    int val = 100;
    __block int blockVal = 200;
    NSString *str = @"origin";
    __block NSString *blockStr = @"block";

    void (^testBlock)(void) = ^{
        NSLog(@"val = %d", val);           // 100，值捕获
        // val = 300; // 编译错误！不能改

        blockVal = 999;                    // OK
        NSLog(@"blockVal = %d", blockVal); // 999

        NSLog(@"str = %@", str);           // origin
        // str = @"new"; // 编译错误
        NSLog(@"blockStr = %@", blockStr); // block

        blockStr = @"changed";             // OK，因为加了 __block
    };

    testBlock();

    // 例子1：累加器
    __block int count = 0;
    void (^counter)(void) = ^{
        count++;
        NSLog(@"第 %d 次", count);
    };
    counter(); // 1
    counter(); // 2

    // 例子2：标记请求完成
//    __block BOOL success = NO;
//    [network request:^{
//        success = YES;   // 没加 __block 就编译不过
//    }];
//    dispatch_after(... , ^{
//        if (success) { /* 干活 */ }
//    });
  }
  return 0;
}
