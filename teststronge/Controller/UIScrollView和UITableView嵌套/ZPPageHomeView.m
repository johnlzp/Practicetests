//
//  ZPPageHomeView.m
//  teststronge
//
//  Created by OS on 2019/12/23.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPPageHomeView.h"
#import "ZPDemoViewController.h"
#import "ZPTableView.h"
#import "ZPPageView.h"
@interface ZPPageHomeView()<UIScrollViewDelegate>

@property (nonatomic,strong)ZPTableView *baseTableView;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)ZPPageView *pageView;
/**x是否悬停了*/
@property (nonatomic , assign) BOOL  isHover;
//**是否在视图中间刷新 默认NO*/
@property (nonatomic , assign) BOOL  isMidRefresh;
@property (nonatomic , assign) CGFloat  headHeight;
@end
@implementation ZPPageHomeView
 
- (instancetype)initWithFrame:(CGRect)frame vcArray:(nonnull NSArray *)array{
    if (self = [self initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.headHeight = 250;
        [self configView:array];
        self.isHover = NO;
        self.isMidRefresh = NO;
        //<ZPTableView: 0x7fcdf8057000; baseClass = UITableView; frame = (0 0; 414 896); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x600002e935d0>; layer = <CALayer: 0x6000020a99e0>; contentOffset: {0, 0}; contentSize: {0, 0}; adjustedContentInset: {0, 0, 0, 0}; dataSource: <ZPDemoViewController: 0x7fcdf7c1efe0>>
        ZPDemoViewController *vc = array[0];
        self.baseTableView = vc.tableView ;
        self.baseTableView.canResponseMutiGesture = YES;
        __weak typeof(self)weakSelf = self;
        self.baseTableView.scrollViewDidScrollBlock = ^(UIScrollView * _Nonnull scrollView) {
            [weakSelf tableViewDidScrollView:scrollView];
        };
        
    }
    return self;
}

- (void)configView:(NSArray *)array{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollView.contentSize = CGSizeMake(self.width, self.height + self.headHeight);
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
//    CGRectMake(0, CGRectGetMaxY(yview.frame), SCREEN_WIDTH, self.height + self.headHeight) 
    self.pageView = [[ZPPageView alloc]initWithFrame:CGRectMake(0, self.headHeight, SCREEN_WIDTH, self.height + self.headHeight) controllers:array];
    [self.scrollView addSubview:self.pageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.scrollView) {
//        /**设置headView的位置*/
//        if (self.scrollView.contentOffset.y >= self.headHeight) { //偏移量大于等于了headerView后 悬停
//            self.scrollView.contentOffset = CGPointMake(0, self.headHeight);
//            self.isHover = YES;
//        }else{//偏移量还没有达到 haderview的位置，就不需要处理 scrollView的偏移量
//            if (self.isHover) {//偏移量大于等于了headerView后 悬停，在else多处理一次悬停处理，是因为让使用起来更加流程，不需要在达到临界点后卡顿一次后才能继续滑动
//                self.scrollView.contentOffset = CGPointMake(0, self.headHeight);
//            }
//        }
//
//        if (self.isMidRefresh && self.baseTableView.contentOffset.y<=0 && scrollView.contentOffset.y <=0) {//滑动到了最顶部的位置，并且设置的刷新位置是在中间，固定scrollView
//            self.scrollView.contentOffset = CGPointZero;
//        }else{
//            /**设置下面tableView的位置*/
//            if (self.scrollView.contentOffset.y < self.headHeight) {
//                if (!self.isHover) {
//                    //列表的偏移都设置为零
//                    self.baseTableView.contentOffset = CGPointZero;
//                }
//            }
//        }
        
        CGFloat scy = scrollView.contentOffset.y;
        if (scy >= self.headHeight) {
            self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, self.headHeight);
        }else{
            if (self.isHover) {
                self.scrollView.contentOffset = CGPointMake(0, self.headHeight);
            }
        }
        
    }
}

- (void)tableViewDidScrollView:(UIScrollView *)scrollView{
//    if (self.isMidRefresh && scrollView.contentOffset.y <0 && !self.isHover  && self.scrollView.contentOffset.y<=0) {//到顶部之后的下拉处理
//        self.scrollView.contentOffset = CGPointZero;
//    }else{
//        if (!self.isHover) {//没有悬停时
//            scrollView.contentOffset = CGPointZero;
//        }
//        if (scrollView.contentOffset.y <=0) {
//            self.isHover = NO;
//            scrollView.contentOffset = CGPointZero;
//        }else{
//            self.isHover = YES;
//        }
//    }
    
    CGFloat y = scrollView.contentOffset.y;
    CGFloat scy = self.scrollView.contentOffset.y;
    if (!self.isHover) {//没有悬停时
        scrollView.contentOffset = CGPointZero;
    }
    if (y <= 0) {
        self.isHover = NO;
        scrollView.contentOffset = CGPointZero;
    }else{
        self.isHover = YES;
    }
    NSLog(@"tableview：%f    %f",scrollView.contentOffset.y , self.scrollView.contentOffset.y);
}
@end
