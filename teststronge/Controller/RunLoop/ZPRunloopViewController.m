//
//  ZPRunloopViewController.m
//  teststronge
//
//  Created by OS on 2020/2/27.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPRunloopViewController.h"

@interface ZPRunloopViewController ()
@property(nonatomic,strong)NSThread *thread;
@end

@implementation ZPRunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}

- (void)configView{
//    1. kCFRunLoopDefaultMode：App的默认Mode，通常主线程是在这个Mode下运行
//    2. UITrackingRunLoopMode：界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
//    3. UIInitializationRunLoopMode: 在刚启动 App 时第进入的第一个 Mode，启动完成后就不再使用，会切换到kCFRunLoopDefaultMode
//    4. GSEventReceiveRunLoopMode: 接受系统事件的内部 Mode，通常用不到
//    5. kCFRunLoopCommonModes: 这是一个占位用的Mode，作为标记kCFRunLoopDefaultMode和UITrackingRunLoopMode用，并不是一种真正的Mode
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    // [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(show) userInfo:nil repeats:YES];
//    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(show) userInfo:nil repeats:YES];
//    // 加入到RunLoop中才可以运行
//    // 1. 把定时器添加到RunLoop中，并且选择默认运行模式NSDefaultRunLoopMode = kCFRunLoopDefaultMode
//    // [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    // 当textFiled滑动的时候，timer失效，停止滑动时，timer恢复
//    // 原因：当textFiled滑动的时候，RunLoop的Mode会自动切换成UITrackingRunLoopMode模式，因此timer失效，当停止滑动，RunLoop又会切换回NSDefaultRunLoopMode模式，因此timer又会重新启动了
//
//    // 2. 当我们将timer添加到UITrackingRunLoopMode模式中，此时只有我们在滑动textField时timer才会运行
//    // [[NSRunLoop mainRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
//
//    // 3. 那个如何让timer在两个模式下都可以运行呢？
//    // 3.1 在两个模式下都添加timer 是可以的，但是timer添加了两次，并不是同一个timer
//    // 3.2 使用站位的运行模式 NSRunLoopCommonModes标记，凡是被打上NSRunLoopCommonModes标记的都可以运行，下面两种模式被打上标签
//    //0 : <CFString 0x10b7fe210 [0x10a8c7a40]>{contents = "UITrackingRunLoopMode"}
//    //2 : <CFString 0x10a8e85e0 [0x10a8c7a40]>{contents = "kCFRunLoopDefaultMode"}
//    // 因此也就是说如果我们使用NSRunLoopCommonModes，timer可以在UITrackingRunLoopMode，kCFRunLoopDefaultMode两种模式下运行
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    NSLog(@"%@",[NSRunLoop mainRunLoop]);
//
//    // performSelector默认是在default模式下运行，因此在滑动ScrollView时，图片不会加载
//       // [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"abc"] afterDelay:2.0 ];
//       // inModes: 传入Mode数组
////       [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"abc"] afterDelay:2.0 inModes:@[NSDefaultRunLoopMode,UITrackingRunLoopMode]];
//}
//-(void)show
//{
//    NSLog(@"-------");
//}

//CFRunLoopObserverRef
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//     //创建监听者
//     /*
//     第一个参数 CFAllocatorRef allocator：分配存储空间 CFAllocatorGetDefault()默认分配
//     第二个参数 CFOptionFlags activities：要监听的状态 kCFRunLoopAllActivities 监听所有状态
//     第三个参数 Boolean repeats：YES:持续监听 NO:不持续
//     第四个参数 CFIndex order：优先级，一般填0即可
//     第五个参数 ：回调 两个参数observer:监听者 activity:监听的事件
//     */
//     /*
//     所有事件
//     typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
//     kCFRunLoopEntry = (1UL << 0),   //   即将进入RunLoop
//     kCFRunLoopBeforeTimers = (1UL << 1), // 即将处理Timer
//     kCFRunLoopBeforeSources = (1UL << 2), // 即将处理Source
//     kCFRunLoopBeforeWaiting = (1UL << 5), //即将进入休眠
//     kCFRunLoopAfterWaiting = (1UL << 6),// 刚从休眠中唤醒
//     kCFRunLoopExit = (1UL << 7),// 即将退出RunLoop
//     kCFRunLoopAllActivities = 0x0FFFFFFFU
//     };
//     */
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        switch (activity) {
//            case kCFRunLoopEntry:
//                NSLog(@"RunLoop进入");
//                break;
//            case kCFRunLoopBeforeTimers:
//                NSLog(@"RunLoop要处理Timers了");
//                break;
//            case kCFRunLoopBeforeSources:
//                NSLog(@"RunLoop要处理Sources了");
//                break;
//            case kCFRunLoopBeforeWaiting:
//                NSLog(@"RunLoop要休息了");
//                break;
//            case kCFRunLoopAfterWaiting:
//                NSLog(@"RunLoop醒来了");
//                break;
//            case kCFRunLoopExit:
//                NSLog(@"RunLoop退出了");
//                break;
//
//            default:
//                break;
//        }
//    });
//
//    // 给RunLoop添加监听者
//    /*
//     第一个参数 CFRunLoopRef rl：要监听哪个RunLoop,这里监听的是主线程的RunLoop
//     第二个参数 CFRunLoopObserverRef observer 监听者
//     第三个参数 CFStringRef mode 要监听RunLoop在哪种运行模式下的状态
//     */
//    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
//     /*
//     CF的内存管理（Core Foundation）
//     凡是带有Create、Copy、Retain等字眼的函数，创建出来的对象，都需要在最后做一次release
//     GCD本来在iOS6.0之前也是需要我们释放的，6.0之后GCD已经纳入到了ARC中，所以我们不需要管了
//     */
//    CFRelease(observer);
//}

//常驻线程
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   // 创建子线程并开启
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(show) object:nil];
    self.thread = thread;
    [thread start];
}
-(void)show
{
    // 注意：打印方法一定要在RunLoop创建开始运行之前，如果在RunLoop跑起来之后打印，RunLoop先运行起来，已经在跑圈了就出不来了，进入死循环也就无法执行后面的操作了。
    // 但是此时点击Button还是有操作的，因为Button是在RunLoop跑起来之后加入到子线程的，当Button加入到子线程RunLoop就会跑起来
    NSLog(@"%s",__func__);
    // 1.创建子线程相关的RunLoop，在子线程中创建即可，并且RunLoop中要至少有一个Timer 或 一个Source 保证RunLoop不会因为空转而退出，因此在创建的时候直接加入
    // 添加Source [NSMachPort port] 添加一个端口
    [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    // 添加一个Timer
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    //创建监听者
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"RunLoop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"RunLoop要处理Timers了");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"RunLoop要处理Sources了");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"RunLoop要休息了");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"RunLoop醒来了");
                break;
            case kCFRunLoopExit:
                NSLog(@"RunLoop退出了");
                break;
            
            default:
                break;
        }
    });
    // 给RunLoop添加监听者
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    // 2.子线程需要开启RunLoop
    [[NSRunLoop currentRunLoop]run];
    CFRelease(observer);
}

- (IBAction)btnClick:(id)sender {
    //回到主线程执行操作
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}

-(void)test
{
    NSLog(@"当前线程%@",[NSThread currentThread]);
}



@end
