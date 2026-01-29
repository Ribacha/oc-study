//
//  ViewController.m
//  GCD Study
//
//  Created by 开开心心的macbook air on 2025/11/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self syncConcurrent];
    // Do any additional setup after loading the view.
}
//- (void) treadTest {
//    NSLog(@"我是test1");
//    NSLog(@"我是test2");
//    
//}
//- (void)threadTest{
//    dispatch_queue_t queue = dispatch_queue_create("队列1", DISPATCH_QUEUE_SERIAL);
//    //同步 不开启新线程，所以在主线程执行
//    dispatch_sync(queue, ^{
//        NSLog(@"任务1");
//        [self getCurrentThread];
//    });
//    //异步 开启新线程
//    dispatch_async(queue, ^{
//        NSLog(@"任务2");//2
//        [self getCurrentThread];
//    });
//    sleep(3);//如果没有这个方法，2,3的执行先后顺序是不确定的，因为是两个线程，执行先后没有关系
//    NSLog(@"方法执行结束");//3
//}
//- (void) threadTest {
//    dispatch_queue_t queue = dispatch_queue_create("队列 1", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"这是任务2");
//    [self getCurrentThread];
//    dispatch_sync(queue, ^{
////        sleep(3);
//        NSLog(@"这是任务 1");
//        [self getCurrentThread];
//    });
//    NSLog(@"方法执行结束");
//    
//}
//- (void) threadTest {
//    dispatch_queue_t queue = dispatch_queue_create("队列1", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"任务2");
//    [self getCurrentThread];
//    dispatch_async(queue, ^{
////        sleep(3);
//        NSLog(@"任务1");
//        [self getCurrentThread];
//    });
//    NSLog(@"方法执行结束");
//}

/**
* 同步执行 + 并发队列
* 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
*/
- (void)syncConcurrent {
NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
NSLog(@"syncConcurrent---begin");
dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
dispatch_sync(queue, ^{
// 追加任务 1
[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
});
dispatch_sync(queue, ^{
// 追加任务 2
[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
});
dispatch_sync(queue, ^{
// 追加任务 3
[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
});
NSLog(@"syncConcurrent---end");
}
//- (void)getCurrentThread{
//    NSThread *currentThread = [NSThread currentThread];
//    NSLog(@"currentThread == %@",currentThread);
//}

@end
