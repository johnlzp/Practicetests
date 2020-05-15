//
//  ZPIrregularViewController.m
//  teststronge
//
//  Created by OS on 2019/12/12.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPIrregularViewController.h"
#import "YLWaterFlowLayout.h"
#import "ZPTypographyCollectionCell.h"
#import "YLWaterFlowLayout.h"
#import "UILabel+ZPExtension.h"
typedef void(^optionBlock)(void);
@interface ZPIrregularViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,YLWaterFlowLayoutDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *tagsArray;
@end

@implementation ZPIrregularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configView];
//    __weak typeof(self) weakSelf = self;
//    optionBlock = ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{//延时2秒执行下面的代码
//             NSLog(@"%@",weakSelf);
//        });
//    };
//    optionBlock();
}

- (void)configView{
    self.tagsArray = @[@"篮球",
    @"足球",
    @"羽毛球",
    @"乒乓球",
    @"排球",
    @"网球",
    @"高尔夫球",
    @"冰球",
    @"沙滩排球",
    @"棒球反倒是解放路大开杀戒封口了大手机福利卡借多少考虑放",
    @"垒球",
    @"藤球",
    @"毽球",
    @"台球",
    @"鞠蹴",
    @"板球",
    @"壁球",
    @"沙壶",
    @"克郎球",
    @"橄榄球",
    @"曲棍球",
    @"水球",
    @"马球",
    @"保龄球",
    @"健身球",
    @"门球",
    @"弹球"
    ];
    
    YLWaterFlowLayout *layout = [[YLWaterFlowLayout alloc]init];
    layout.rowHeight = 40;
    layout.delegate = self;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
//    layout.minimumLineSpacing = 10;
//    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 60 -20)  / 4, (SCREEN_WIDTH - 60 -20) / 4);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZPTypographyCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"ZPTypographyCollectionCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(220);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).mas_offset(10);
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).mas_offset(-10);
        } else {
            make.top.mas_equalTo(90);
            make.bottom.mas_equalTo(-40);
        }
    }];
    
}

/**通过代理获得每个cell的宽度*/
- (CGFloat)waterFlowLayout:(YLWaterFlowLayout *)layout widthAtIndexPath:(NSIndexPath *)indexPath{
    return ceil([UILabel getNoteText:self.tagsArray[indexPath.row] font:17 width:SCREEN_WIDTH - 20].width) + 1 + 20;
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.tagsArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(ceil([UILabel getNoteText:self.tagsArray[indexPath.row] font:17 width:SCREEN_WIDTH - 20].width) + 1, 40);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZPTypographyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZPTypographyCollectionCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.tagsArray[indexPath.row];
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
