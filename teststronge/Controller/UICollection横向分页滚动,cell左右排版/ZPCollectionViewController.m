//
//  ZPCollectionViewController.m
//  teststronge
//
//  Created by OS on 2019/12/11.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPCollectionViewController.h"
#import "ZPTypographyCollectionCell.h"
#import "ZPTypographyFlowLayout.h"
@interface ZPCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ZPHorizontalCollectionFlowLayoutDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)NSArray *arrCount;
@end

@implementation ZPCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configView];
}

- (void)configView{
    self.arrCount = @[@18];
    ZPTypographyFlowLayout *layout = [[ZPTypographyFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemCountPerRow = 4;
    layout.delegate = self;
    layout.rowCount = 2;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    layout.minimumLineSpacing = 20;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 60 -20)  / 4, (SCREEN_WIDTH - 60 -20) / 4);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZPTypographyCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"ZPTypographyCollectionCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(220);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).mas_offset(10);
        } else {
            make.top.mas_equalTo(90);
        }
    }];
    
    self.pageControl = [[UIPageControl alloc]init];
    self.pageControl.numberOfPages = ceilf([self.arrCount.firstObject integerValue] / 8.0);
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.defersCurrentPageDisplay = YES;
//    [self.pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.collectionView.mas_bottom).mas_offset(10);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
}

#pragma mark - action
- (void)pageChange:(UIPageControl *)pageControl{
    NSLog(@"页码%ld  %f",(long)pageControl.currentPage,ceilf(pageControl.currentPage / 8.0));
    NSInteger row = ceilf(pageControl.currentPage / 8.0) * 8;
//    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - ZPHorizontalCollectionFlowLayoutDelegate
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout cellCenteredAtIndexPath:(NSIndexPath *)indexPath page:(int)page{
    self.pageControl.currentPage = page;
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.arrCount[section] integerValue];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZPTypographyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZPTypographyCollectionCell" forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"第%ld个数据",indexPath.row];
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    CGFloat rr = r / 255.0;
    CGFloat rg = g / 255.0;
    CGFloat rb = b / 255.0;
    cell.backgroundColor = [[UIColor alloc]initWithRed:rr green:rg blue:rb alpha:1];

    return cell;
}



 


@end
