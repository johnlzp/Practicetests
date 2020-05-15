//
//  ZPWaterfallFlowLayout.m
//  teststronge
//
//  Created by OS on 2019/12/12.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPWaterfallFlowLayout.h"

@implementation ZPWaterfallFlowLayout

- (void)prepareLayout{
    [super prepareLayout];
 
}
//1）-(void)prepareLayout  设置layout的结构和初始需要的参数等。
//
//2)  -(CGSize) collectionViewContentSize 确定collectionView的所有内容的尺寸。
//
//3）-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect初始的layout的外观将由该方法返回的UICollectionViewLayoutAttributes来决定。
//
//4)在需要更新layout时，需要给当前layout发送
//     1)-invalidateLayout， 该消息会立即返回，并且预约在下一个loop的时候刷新当前layout
//     2)-prepareLayout，
//     3)依次再调用-collectionViewContentSize和-layoutAttributesForElementsInRect来生成更新后的布局。
@end
