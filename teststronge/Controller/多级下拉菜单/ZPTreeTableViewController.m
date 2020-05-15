//
//  ZPTreeTableViewController.m
//  teststronge
//
//  Created by OS on 2019/12/28.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPTreeTableViewController.h"
#import "ZPTreeModel.h"
#import "ZPTreeTableViewCell.h"

@interface ZPTreeTableViewController ()<ZPNodeTableViewCellDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *selectDataArray;
@end

@implementation ZPTreeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configArray];
    [self configView];
}

- (void)configView{
    [self.tableView registerClass:[ZPTreeTableViewCell class] forCellReuseIdentifier:@"ZPTreeTableViewCell"];
    self.tableView.rowHeight = 44;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(head)];
}

- (void)head{
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (void)configArray{
    self.selectDataArray = [NSMutableArray array];
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        ZPTreeModel *node = [ZPTreeModel new];
        node.parentID = @"";
        node.childrenID = @"";
        node.level = 1;
        node.name = [NSString stringWithFormat:@"第%d级结点",node.level];
        node.leaf = 0;
        node.root = YES;
        node.expand = NO;
        node.selected = NO;
        [self.dataArray addObject:node];
    }
}

- (void)hiddenChildrenNodesLevel:(int)level atIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *delectRowArray = [NSMutableArray array];
    int index = (int)indexPath.row;
    int hiddenRows = 0;
    for (int i = index + 1; i < self.dataArray.count; i++) {
        ZPTreeModel *model = self.dataArray[i];
        if (model.level > level) {
            hiddenRows += 1;
            [delectRowArray addObject:[NSIndexPath indexPathForRow:i inSection:indexPath.section]];
        }else{
            break;
        }
    }
    
    [self.dataArray removeObjectsInRange:NSMakeRange(index + 1, hiddenRows)];
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:delectRowArray withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
    NSMutableArray *reloadRowArray = [NSMutableArray array];
    for (int i = index + 1; i < self.dataArray.count; i++) {
        [reloadRowArray addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    [self.tableView reloadRowsAtIndexPaths:reloadRowArray withRowAnimation:UITableViewRowAnimationNone];
    
}

- (void)expandChildrenNodesLevel:(int)level atIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *indexRows = [NSMutableArray array];
    ZPTreeModel *model = self.dataArray[indexPath.row];
    int refreshLocation = (int)indexPath.row + 1;
    for (int i = 0; i < 2; i++) {
        ZPTreeModel *addModel = [ZPTreeModel new];
        addModel.level += model.level + 1;
        addModel.parentID = @"";
        addModel.childrenID = @"";
        addModel.name = [NSString stringWithFormat:@"第%d级结点",addModel.level];
        addModel.leaf = 0;
        addModel.root = YES;
        addModel.expand = NO;
        addModel.selected = model.selected;
        [self.dataArray insertObject:addModel atIndex:refreshLocation + i];
        [indexRows addObject:[NSIndexPath indexPathForRow:refreshLocation + i inSection:0]];
    }
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithArray:indexRows] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
    //更新新插入的元素之后的所有cell的cellIndexPath
    NSMutableArray * reloadRows = [NSMutableArray array];
    int reloadLocation = refreshLocation + (int)indexRows.count;
    for (int i = reloadLocation; i < self.dataArray.count; i++) {
        [reloadRows addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    [self.tableView reloadRowsAtIndexPaths:reloadRows withRowAnimation:UITableViewRowAnimationNone];
}

- (void)selectedChildrenNodes:(int)level selected:(BOOL)selected atIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *reloadRowArray = [NSMutableArray array];
    
    int index = (int)indexPath.row + 1;
    for (int i = index; i < self.dataArray.count; i++) {
        ZPTreeModel *model = self.dataArray[i];
        if (model.level > level) {
            model.selected = selected;
            [self.dataArray replaceObjectAtIndex:i withObject:model];
            [reloadRowArray addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }else{
            break;
        }
    }
    [self.tableView reloadRowsAtIndexPaths:reloadRowArray withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZPTreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZPTreeTableViewCell" forIndexPath:indexPath];
    cell.cellSize = CGSizeMake(self.view.frame.size.width, 44);
    cell.cellIndexPath = indexPath;
    cell.delegate = self;
    cell.node = self.dataArray[indexPath.row];
    [cell refreshCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - SLNodeTableViewCellDelegate
- (void)nodeTableViewCell:(ZPTreeTableViewCell *)cell selected:(BOOL)selected atIndexPath:(NSIndexPath *)indexPath {
    //    [self.dataSource replaceObjectAtIndex:indexPath.row withObject:cell.node];
    [self selectedChildrenNodes:cell.node.level selected:selected atIndexPath:indexPath];
}

- (void)nodeTableViewCell:(ZPTreeTableViewCell *)cell expand:(BOOL)expand atIndexPath:(NSIndexPath *)indexPath {
    //    [self.dataSource replaceObjectAtIndex:indexPath.row withObject:cell.node];
    if (expand) {
        [self expandChildrenNodesLevel:cell.node.level atIndexPath:indexPath];
    }else{
        [self hiddenChildrenNodesLevel:cell.node.level atIndexPath:indexPath];
    }
}

@end
