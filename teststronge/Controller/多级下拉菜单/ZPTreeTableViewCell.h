//
//  ZPTreeTableViewCell.h
//  teststronge
//
//  Created by OS on 2019/12/28.
//  Copyright © 2019 OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZPTreeModel.h"
 
NS_ASSUME_NONNULL_BEGIN
@class ZPTreeTableViewCell;
@protocol ZPNodeTableViewCellDelegate <NSObject>
- (void)nodeTableViewCell:(ZPTreeTableViewCell *)cell selected:(BOOL)selected atIndexPath:(NSIndexPath *)indexPath; //选中的代理
- (void)nodeTableViewCell:(ZPTreeTableViewCell *)cell expand:(BOOL)expand atIndexPath:(NSIndexPath *)indexPath;  //展开的代理
@end
@interface ZPTreeTableViewCell : UITableViewCell
@property (nonatomic,strong)ZPTreeModel *node;
@property (nonatomic, strong) NSIndexPath *cellIndexPath; // cell的位置
@property (nonatomic, assign) CGSize cellSize; // 宽高
@property (nonatomic, weak) id <ZPNodeTableViewCellDelegate> delegate;

- (void)refreshCell;
@end

NS_ASSUME_NONNULL_END
