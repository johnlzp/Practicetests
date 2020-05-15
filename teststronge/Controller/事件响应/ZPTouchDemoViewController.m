//
//  ZPTouchDemoViewController.m
//  teststronge
//
//  Created by OS on 2020/1/10.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPTouchDemoViewController.h"
#import "ZPGreenView.h"
#import "ZPRedView.h"
#import "ZPTouchTwoViewController.h"
@interface ZPTouchDemoViewController ()
/**同级关系*/
@property (weak, nonatomic) IBOutlet ZPGreenView *greenView;
@property (weak, nonatomic) IBOutlet ZPRedView *redView;

/**父子关系 */
@property (weak, nonatomic) IBOutlet ZPRedView *sGreenView;
@property (weak, nonatomic) IBOutlet ZPGreenView *sonRedView;

@end

@implementation ZPTouchDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    //摘自https://www.jianshu.com/p/3e53d4d5f293
    //https://www.jianshu.com/p/2e074db792ba   
}

//如果不重写子视图的 hitTest：withEvent：方法，
//A:green
//b:green，因为点击之后，keywindow会从上至下找到最适合的view(green)，
//c:red，同上
//a1:控制器，因为green已经超过了父视图的范围，所以无法响应点击事件，所以该view无法响应，需要向上查找green的父视图也就是控制器的view，所以是控制器响应
//b1:green
//c1:red
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self printResponderChain];
    [super touchesBegan:touches withEvent:event];
    NSLog(@"控制器 %s",__func__);
}

- (void)configView{
    UITapGestureRecognizer *greentap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(greenClick)];
    UITapGestureRecognizer *redtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(redClick)];
//    [self.greenView addGestureRecognizer:greentap];
//    [self.redView addGestureRecognizer:redtap];
}

- (void)greenClick{
    NSLog(@"点击绿色");
}

- (void)redClick{
    NSLog(@"点击红色");
}


#pragma mark - 按钮点击  
- (IBAction)bottomClick:(id)sender {
    NSLog(@"底部蓝色");
}

- (IBAction)bottomOrangClick:(id)sender {
    NSLog(@"底部橙色");
}
- (IBAction)bottomRedClick:(id)sender {
    NSLog(@"底部红色");
}

- (void)printResponderChain
{
    UIResponder *responder = self;
    printf("%s",[NSStringFromClass([responder class]) UTF8String]);
    while (responder.nextResponder) {
        responder = responder.nextResponder;
        printf(" --> %s",[NSStringFromClass([responder class]) UTF8String]);
    }
}
- (IBAction)present:(id)sender {
    ZPTouchTwoViewController *vc = [ZPTouchTwoViewController new];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

@end
