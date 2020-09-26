//
//  ZPExcelViewController.m
//  teststronge
//
//  Created by 刘佳 on 2020/9/23.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPExcelViewController.h"
#import "ZPExcelCell.h"
#import "ZPBallResultScrollView.h"

@interface ZPExcelViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,assign)NSInteger index;
@end

@implementation ZPExcelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self configTableView];
    [self configView];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemsWithtext:@"切换" hiText:@"切换" textColor:[UIColor blackColor] font:14 target:self action:@selector(changeClick:)];
    [self addUnJoinVipView];
}

- (void)configTableView{
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)configView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.itemSize = CGSizeMake(w, w);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ZPExcelCell class] forCellWithReuseIdentifier:@"ZPExcelCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 12, -400, 12));
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(400);
    }];
    
    ZPBallResultScrollView *labelView = [ZPBallResultScrollView new];
    [labelView configViewWith:@[@"2",@"2",@"2",@"2",@"2",@"2"@"2"]];
    [self.view addSubview:labelView];
    [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(self.collectionView.mas_bottom).offset(12);
        make.height.mas_equalTo(30);
    }];
}

- (void)addUnJoinVipView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(12, 470, SCREEN_WIDTH - 24, 70)];
    //[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.05]
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,0);
    view.layer.shadowRadius = 4;
    view.layer.shadowOpacity = 1;
    view.layer.cornerRadius = 4.0;
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: view];
    UIView *subView = [[UIView alloc]initWithFrame:view.bounds];
    subView.layer.cornerRadius = 4.0;
    subView.backgroundColor = [UIColor whiteColor];
//    [view addSubview:subView];
    
}

/**
 *  周边加阴影，并且同时圆角
 */
- (UIView *)addShadowToView:(UIView *)view withOpacity:(float)shadowOpacity shadowRadius:(CGFloat)shadowRadius andCornerRadius:(CGFloat)cornerRadius {
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    UIView *shadowView = [[UIView alloc] init];
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(0, 0);
    shadowView.layer.shadowOpacity = shadowOpacity;
    shadowView.layer.shadowRadius = shadowRadius;
    shadowView.layer.cornerRadius = cornerRadius;
    shadowView.clipsToBounds = NO;
    [shadowView addSubview:view];
    return shadowView;
}



#pragma mark - UITableViewDelegate


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZPExcelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZPExcelCell" forIndexPath:indexPath];
//    if (self.index > 0) {
        cell.isCurrent = self.isCurrent;
//    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH - 24, 64);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 10;
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (void)changeClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    self.isCurrent = btn.selected;
    self.index += 1;
    [self.collectionView reloadData];
}
@end
