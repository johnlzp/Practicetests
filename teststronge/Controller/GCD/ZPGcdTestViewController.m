//
//  ZPGcdTestViewController.m
//  teststronge
//
//  Created by OS on 2020/2/26.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPGcdTestViewController.h"

@interface ZPGcdTestViewController ()

@end

@implementation ZPGcdTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self configView];
//    [self testgroup];
    [self testgroup2];
}

- (void)configView{
    //快速迭代
    dispatch_apply(6, dispatch_queue_create("a", DISPATCH_QUEUE_CONCURRENT), ^(size_t index) {
         NSLog(@"%zd--%@",index ,[NSThread currentThread]);
    });
    NSLog(@"end");
    
}

 //队列组
- (void)testgroup{
    NSURLSession *session = [NSURLSession sharedSession];
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"2----%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"3----%@",[NSThread currentThread]);
        });
//        NSLog(@"3----%@",[NSThread currentThread]);
    });
    
    NSLog(@"end");
}

//如果队列组中的任务本来就是异步的，那么必须配合dispatch_group_enter、dispatch_group_leave来实现需求
- (void)testgroup2{
    NSURLSession *session = [NSURLSession sharedSession];
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
//    dispatch_group_async(group, queue, ^{
    dispatch_group_enter(group);
        dispatch_async(dispatch_queue_create("1", DISPATCH_QUEUE_SERIAL), ^{
            [NSThread sleepForTimeInterval:5];
            NSLog(@"任务1");
            dispatch_group_leave(group);
        });
//    NSURLSessionDataTask *task1 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/hero/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                    NSLog(@"任务1 完成，线程：%@", [NSThread currentThread]);
//                }];
//        [task1 resume];
//    });
    	
//    dispatch_group_async(group, queue, ^{
//        NSURLSessionDataTask *task2 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/thumbnails/erin-sarofsky/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                        NSLog(@"任务2 完成，线程：%@", [NSThread currentThread]);
//                    }];
//        [task2 resume];
    dispatch_group_enter(group);
        dispatch_async(dispatch_queue_create("12", DISPATCH_QUEUE_SERIAL), ^{
            [NSThread sleepForTimeInterval:5];
            NSLog(@"任务2");
            dispatch_group_leave(group);
        });
//    });
    
    dispatch_group_notify(group, queue, ^{
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"3----%@",[NSThread currentThread]);
        });
//        NSLog(@"3----%@",[NSThread currentThread]);
    });
    
    NSLog(@"end");
}

@end
