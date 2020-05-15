//
//  ZPURLSessionViewController.m
//  teststronge
//
//  Created by OS on 2020/1/2.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPURLSessionViewController.h"

@interface ZPURLSessionViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressview;
@property (weak, nonatomic) IBOutlet UIImageView *resImgView;

@end

@implementation ZPURLSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


#pragma mark - action
/**文本请求*/
- (IBAction)textRequest:(id)sender {
}
/**图片下载请求*/
- (IBAction)imgDownloadRequest:(id)sender {
}
/**图片上传*/
- (IBAction)imgUpload:(id)sender {
}
/**下载任务*/
- (IBAction)downloadRequest:(id)sender {
}
/**暂停*/
- (IBAction)suspendClick:(id)sender {
}
/**开始 */
- (IBAction)startClick:(id)sender {
}
/**取消*/
- (IBAction)cancelClick:(id)sender {
}

@end
