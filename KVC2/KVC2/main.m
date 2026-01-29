//
//  main.m
//  KVC2
//
//  Created by 开开心心的macbook air on 2025/9/26.
//

#import <Foundation/Foundation.h>
#import "KVC1.h"
#import "KVCNext.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        KVC1 *test = [[KVC1 alloc] init];
//        [test setValue:@[] forKey:@"ary"];
//        [test setValue:@"12222" forKey:@"str"];
//        [test setValue:@"12" forKey:@"age"];
//        NSLog(@"%@", test->isAge);
//        NSLog(@"%@", test->_age);
//        NSLog(@"%@", test.str);
//        NSLog(@"%@", test.ary);
//        NSLog(@"%@", [test valueForKey:@"age"]);
//        KVCNext *test2 = [[KVCNext alloc] init];
//        [test2 setValue:test forKey:@"test"];
//        [test2 setValue:@"1222" forKeyPath:@"test.str"];
//        NSLog(@"%@", [test2 valueForKeyPath:@"test.str"]);
//        id value = [test valueForKey:@"aRandomKeyThatDoesNotExist"];
//        NSLog(@"获取到的值: %@", value);
//        [test setValue:@"some data" forKey:@"anotherRandomKey"];
//        [test setValue:nil forKey:@"age"];
                NSArray* arrStr = @[@"english",@"franch",@"chinese"];
                NSArray* arrCapStr = [arrStr valueForKey:@"capitalizedString"];
                for (NSString* str  in arrCapStr) {
                    NSLog(@"%@",str);
                }
                NSArray* arrCapStrLength = [arrStr valueForKeyPath:@"capitalizedString.length"];
                for (NSNumber* length  in arrCapStrLength) {
                    NSLog(@"%ld",(long)length.integerValue);
                }
//                NSLog(@"%@", test.ary);
            }
            return 0;
}
