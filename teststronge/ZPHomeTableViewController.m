//
//  ZPHomeTableViewController.m
//  teststronge
//
//  Created by OS on 2020/1/10.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPHomeTableViewController.h"
#import "ZPCollectionViewController.h"
#import "ZPIrregularViewController.h"
#import "ZPNestedViewController.h"
#import "ZPTreeTableViewController.h"
#import "ZPAttribuiteLabelViewController.h"
#import "ZPURLSessionViewController.h"
#import "ZPTouchDemoViewController.h"
#import "ZPBrainTreeVC.h"
#import "ZPRoundConerDemoVC.h"
#import "ZPSettingNavViewController.h"
#import "ZPBlockViewController.h"
#import "ZPGcdTestViewController.h"
#import "ZPRunloopViewController.h"
#import "ZPBezierTestViewController.h"
#import "ZPQRcodeViewController.h"
#import "differentDirectionsVc.h"
#import "ViewController.h"
@interface ZPHomeTableViewController ()
@property (nonatomic,strong)NSArray *array;
@end

@implementation ZPHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBar.translucent = NO;
    self.title = @"测试";
    self.array = @[@"富文本label",
                   @"左右滑动菜单",
                   @"UICollection不规则标签",
                   @"UICollection横向分页滚动,cell左右排版",
                   @"网络请求",
                   @"多级下拉菜单",
                   @"UIScrollView和UITableView嵌套",
                   @"事件响应链",
                   @"BrainTree支付",
                   @"UITableViewCell切圆角",
                   @"navigationbar的一些实验",
                   @"Block的探究",
                   @"GCD相关",
                   @"RunLoop",
                   @"贝塞尔曲线和水波动画",
                   @"QRCode",
                   @"不同方向的弹窗"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            ZPAttribuiteLabelViewController *vc = [ZPAttribuiteLabelViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            ViewController *vc = [ViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case 2:
        {
            ZPIrregularViewController *vc = [ZPIrregularViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case 3:
        {
            ZPCollectionViewController *vc = [ZPCollectionViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case 4:
        {
            ZPURLSessionViewController *vc = [ZPURLSessionViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case 5:
        {
            ZPTreeTableViewController *vc = [ZPTreeTableViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case 6:
        {
            ZPNestedViewController *vc = [ZPNestedViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case 7:
        {
            ZPTouchDemoViewController *vc = [ZPTouchDemoViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
            
        case 8:
        {
            ZPBrainTreeVC *vc = [ZPBrainTreeVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 9:
        {
            ZPRoundConerDemoVC *vc = [ZPRoundConerDemoVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 10:
        {
            ZPSettingNavViewController *vc = [ZPSettingNavViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 11:
        {
            ZPBlockViewController *vc = [ZPBlockViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 12:
        {
            ZPGcdTestViewController *vc = [ZPGcdTestViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 13:
        {
            ZPRunloopViewController *vc = [ZPRunloopViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 14:
        {
            ZPBezierTestViewController *vc = [ZPBezierTestViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 15:
       {
           ZPQRcodeViewController *vc = [ZPQRcodeViewController new];
           [self.navigationController pushViewController:vc animated:YES];
       }
           break;
        case 16:
        {
            differentDirectionsVc *vc = [differentDirectionsVc new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
        default:
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
