//
//  ZPTypographyFlowLayout.h
//  teststronge
//
//  Created by OS on 2019/12/11.
//  Copyright © 2019 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZPHorizontalCollectionFlowLayoutDelegate

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout cellCenteredAtIndexPath:(NSIndexPath *)indexPath page:(int)page;

@end
/**UICollection横向分页滚动,cell左右排版  针对于一个section*/
@interface ZPTypographyFlowLayout : UICollectionViewFlowLayout
// 一行中 cell的个数
@property (nonatomic) NSUInteger itemCountPerRow;
// 一页显示多少行
@property (nonatomic) NSUInteger rowCount;

@property (nonatomic,weak) id<ZPHorizontalCollectionFlowLayoutDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
