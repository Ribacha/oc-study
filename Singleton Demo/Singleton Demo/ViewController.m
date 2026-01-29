//
//  ViewController.m
//  Singleton Demo
//
//  Created by 开开心心的macbook air on 2025/9/8.
//
#import "ViewController.h"
#import "LazyGcdSingleton.h"
#import "LazyLockSingleton.h"
#import "EagerSingleton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LazyGcdSingleton *s1 = [LazyGcdSingleton sharedInstance];
    LazyGcdSingleton *s2 = [LazyGcdSingleton sharedInstance];
    LazyLockSingleton *s3 = [LazyLockSingleton sharedInstance];
    LazyLockSingleton *s4 = [LazyLockSingleton sharedInstance];
    EagerSingleton *s5 = [EagerSingleton sharedInstance];
    EagerSingleton *s6 = [EagerSingleton sharedInstance];
    NSLog(@"s1: %p,s2: %p ", s1, s2);
    NSLog(@"s3: %p,s4: %p ", s3, s4);
    NSLog(@"s5: %p,s6: %p ", s5, s6);
    LazyGcdSingleton* gcd = [[LazyGcdSingleton alloc] init];
    NSLog(@"%@", gcd.ok);
    gcd.ok = @"okok";
    NSLog(@"%@", gcd.ok);
    LazyGcdSingleton* gcd1 = [[LazyGcdSingleton alloc] init];
    gcd1.ok = @"ok1";
    NSLog(@"%@", gcd1.ok);
}


@end
