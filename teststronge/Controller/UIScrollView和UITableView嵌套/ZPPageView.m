//
//  ZPPageView.m
//  teststronge
//
//  Created by OS on 2019/12/26.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPPageView.h"
@interface ZPPageView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic , strong) NSArray * contentCtrollers;
@end
@implementation ZPPageView

- (instancetype)initWithFrame:(CGRect)frame controllers:(NSArray *)controllers{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentCtrollers = controllers;
        
        UIView *yview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        yview.backgroundColor = [UIColor yellowColor];
        [self addSubview:yview];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, self.height - 50);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(yview.frame), SCREEN_WIDTH, self.height - 50) collectionViewLayout:layout];
       self.collectionView.pagingEnabled = YES;
        self.collectionView.bounces = NO;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MCContent"];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.contentCtrollers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MCContent" forIndexPath:indexPath];
    cell.highlighted = NO;
    return cell;
}

//将要加载某个Item时调用的方法  1 1.5  9 9  1.5 2  1 9  2 1  9 = 2.5 + 18 + 3.5 + 10 + 12 = 20.5 + 22 + 3.5 = 46
//3.5 + 10 + 9 + 7 + 4 + 3 + 2 + 3 + 4 + 7 + 6 + 6 + 8 = 72.5
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *childVC = self.contentCtrollers[indexPath.item];
    childVC.view.frame = cell.contentView.bounds;
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (![cell.contentView.subviews containsObject:childVC.view]) {
        [cell.contentView addSubview:childVC.view];
    }
}
@end
