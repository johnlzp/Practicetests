//
//  ZPTreeModel.h
//  teststronge
//
//  Created by OS on 2019/12/28.
//  Copyright © 2019 OS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZPTreeModel : NSObject
@property (nonatomic, strong) NSString *parentID; // 父结点ID 即当前结点所属的的父结点ID

@property (nonatomic, strong) NSString *childrenID; //子结点ID 即当前结点的ID

@property (nonatomic, strong) NSString *name; //结点名字

@property (nonatomic, assign) int level; // 结点层级 从1开始

@property (nonatomic, assign) BOOL leaf;  // 树叶(Leaf) If YES：此结点下边没有结点咯；

@property (nonatomic, assign) BOOL root;  // 树根((Root) If YES: parentID = nil

@property (nonatomic, assign) BOOL expand; // 是否展开

@property (nonatomic, assign) BOOL selected; // 是否选中

@end

NS_ASSUME_NONNULL_END
