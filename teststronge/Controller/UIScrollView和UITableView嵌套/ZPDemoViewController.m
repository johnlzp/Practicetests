//
//  ZPDemoViewController.m
//  teststronge
//
//  Created by OS on 2019/12/20.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPDemoViewController.h"
#import "ZPTableView.h"
@interface ZPDemoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZPDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (ZPTableView *)tableView{
    if (!_tableView) {
        _tableView = [[ZPTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
    }
    return _tableView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.tableView.scrollViewDidScrollBlock) {
        self.tableView.scrollViewDidScrollBlock(scrollView);
    }
//    NSLog(@"真正的偏移量 %f",scrollView.contentOffset.y);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
     if (!cell) {
         cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"cell"];
     }
     cell.textLabel.text = [NSString stringWithFormat:@"%ld个cell",indexPath.row];
     cell.detailTextLabel.text = @(indexPath.row).stringValue;
     return cell;
 }

@end
