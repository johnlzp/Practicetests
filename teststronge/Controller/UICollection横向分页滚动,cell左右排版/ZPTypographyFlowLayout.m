//
//  ZPTypographyFlowLayout.m
//  teststronge
//
//  Created by OS on 2019/12/11.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPTypographyFlowLayout.h"
@interface ZPTypographyFlowLayout()
@property (strong, nonatomic) NSMutableArray *allAttributes;
@end
@implementation ZPTypographyFlowLayout
//准备你需要布局的信息，这个方法会在第一次布局和reloadData()以及invalidateLayout()时会调用，对于那些不会随视图滚动而改变的布局的对象，都应该在这里计算好，进行缓存
- (void)prepareLayout{
    [super prepareLayout];
    self.allAttributes = [NSMutableArray array];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.allAttributes addObject:attributes];
    }
//    CGFloat itemW = self.collectionView.width - self.collectionView.contentInset
}

- (CGSize)collectionViewContentSize{
//    return [super collectionViewContentSize];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    NSUInteger perPage = self.rowCount * self.itemCountPerRow;
    NSUInteger time = count / perPage;
    CGSize size = self.collectionView.frame.size;
    size.width = size.width * (time + 1);
    return size;
}

 //返回指定indexPath的item的布局信息。子类必须重载该方法,该方法
 //只能为cell提供布局信息，不能为补充视图和装饰视图提供。
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger item = indexPath.item;
    NSUInteger x;
    NSUInteger y;
    [self targetPositionWithItem:item resultX:&x resultY:&y];
    NSUInteger item2 = [self originItemAtX:x y:y];
    NSIndexPath *theNewIndexPath = [NSIndexPath indexPathForItem:item2 inSection:indexPath.section];

    UICollectionViewLayoutAttributes *theNewAttr = [super layoutAttributesForItemAtIndexPath:theNewIndexPath];
    theNewAttr.indexPath = indexPath;
    return theNewAttr;
}

//返回布局数组，如果你的布局对象都已经缓存好了，也应该只返回跟layAttributes.frame跟Rect相交的这个区间内的对象数组 
//对于那些随滚动而改变的item,应该在这里进行重新计算， 记住，千万不要在这方法里调用 UICollectionView的visibleCells方法，因为这个范围内所有的cell还没确
//sectionheader sectionfooter decorationview collectionviewcell的属性都会走这个方法  
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    NSMutableArray *tmp = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        
        if (CGRectIntersectsRect(attr.frame, rect)) {//判断两个点是否有交错
            if (visibleRect.origin.x == 0) {
                [self.delegate collectionView:self.collectionView layout:self cellCenteredAtIndexPath:attr.indexPath page:0];
            }else{
                // 除法取整 取余数
                div_t x = div(visibleRect.origin.x,visibleRect.size.width);
                if (x.quot > 0 && x.rem > 0) {
                    [self.delegate collectionView:self.collectionView layout:self cellCenteredAtIndexPath:attr.indexPath page:x.quot + 1];
                }
                if (x.quot > 0 && x.rem == 0) {
                    [self.delegate collectionView:self.collectionView layout:self cellCenteredAtIndexPath:attr.indexPath page:x.quot];
                }
            }
        }
        
        for (UICollectionViewLayoutAttributes *attr2 in self.allAttributes) {
            if (attr.indexPath.item == attr2.indexPath.item) {
                [tmp addObject:attr2];
                break;
            }
        }
    }
    return tmp;
}

//targetContentOffsetForProposedContentOffset:控制控制最后UICollectionView的最后去哪里，我们这里需要做的吸附效果的逻辑代码就需要在这里完成。参数介绍proposedContentOffset:原本UICollectionView停止滚动那一刻的位置；velocity：滚动速度
//-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//}

//shouldInvalidateLayoutForBoundsChange:边界发生改变时，是否需要重新布局，返回YES就需要重新布局(会自动调用layoutAttributesForElementsInRect方法，获得所有cell的布局属性)
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

// 根据 item 计算目标item的位置
// x 横向偏移  y 竖向偏移
- (void)targetPositionWithItem:(NSUInteger)item
                       resultX:(NSUInteger *)x
                       resultY:(NSUInteger *)y
{
    NSUInteger page = item/(self.itemCountPerRow*self.rowCount);

    NSUInteger theX = item % self.itemCountPerRow + page * self.itemCountPerRow;
    NSUInteger theY = item / self.itemCountPerRow - page * self.rowCount;
    if (x != NULL) {
        *x = theX;
    }
    if (y != NULL) {
        *y = theY;
    }
}

// 根据偏移量计算item
- (NSUInteger)originItemAtX:(NSUInteger)x
                          y:(NSUInteger)y
{
    NSUInteger item = x * self.rowCount + y;
    return item;
}
@end
