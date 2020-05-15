//
//  ZPBlockViewController.m
//  teststronge
//
//  Created by OS on 2020/1/16.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPBlockViewController.h"
#import <AFNetworking.h>
void (^test1)(void);
//int (^test2)(int a, int b);
@interface ZPBlockViewController ()
@property (nonatomic,copy)void (^ablock)(NSInteger i);

//@property (nonatomic,assign)int b;
@end

int b;
@implementation ZPBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testBlock1:^(NSInteger i) {
//        NSLog(@"%ld",i);
    }];
    [self configView];
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
    }];
}

- (void)configView{
   static int a;
    //匿名block
    ^{
        a = 10;
        NSLog(@"匿名block%d",a);
    }();
    
    //无参无返回值block
    void (^test2)(void) = ^{
//        NSLog(@"%d",a);
        
    };
    
    //带参带返回值block
    int (^test3)(int a, int b) = ^int(int a,int b){
      
        return 12;
    };
    NSLog(@"%d",test3(1,2));
    
    [self blockreturn];
    
}

//block作为方法参数
- (void)testBlock1:(void (^)(NSInteger i))aBlock{
    if (aBlock) {
        aBlock(10);
    }
}

//block作为返回值
- (void(^)(int a))blockreturn{
    return ^void(int b){
        NSLog(@"block作为返回值  b=%d",b);
    };
}

@end
