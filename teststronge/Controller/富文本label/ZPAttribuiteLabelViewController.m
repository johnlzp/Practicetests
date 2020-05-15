//
//  ZPAttribuiteLabelViewController.m
//  teststronge
//
//  Created by OS on 2019/12/30.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPAttribuiteLabelViewController.h"

@interface ZPAttribuiteLabelViewController ()

@end

@implementation ZPAttribuiteLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    self.navigationController.navigationBar.translucent = NO;
    [self configURL];
}

- (void)configURL{
    NSURLSession *session = [NSURLSession sharedSession];
//    NSURL *url = [NSURL URLWithString:@"http://www.daka.com/login?username=daka&pwd=123"];
//    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//         NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
//    }];
//    [task resume];
    
    NSURL *url = [NSURL URLWithString:@"http://www.daka.com/login"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"username=daka&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionTask *postTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    [postTask resume];
}


- (void)configView{
    NSString *str = @"这是测试数据，为了测试图文混排等功能。为了测试图文混排等功能。为了测试图文混排等功能。为了测试图文混排等功能。这是点击范围";
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 200)];
    label.text = str;
    label.font = [UIFont systemFontOfSize:16.0];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    NSTextAttachment *attach = [NSTextAttachment new];
    attach.image = [UIImage imageNamed:@"selected"];
    attach.bounds = CGRectMake(0, 0, 20, 20);
//    NSAttributedString *imgStr = [NSAttributedString attributedStringWithAttachment:attach];
//    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:label.text];
//    [attributeStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]} range:NSMakeRange(0, attributeStr.length)];
//    [attributeStr insertAttributedString:imgStr atIndex:0];
//    label.attributedText = attributeStr;
    
    UILabel *imgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    imgLabel.text = @"店铺优惠";
    imgLabel.backgroundColor = [UIColor redColor];
    imgLabel.layer.cornerRadius = 5.0;
    imgLabel.layer.masksToBounds = YES;
    imgLabel.font = [UIFont systemFontOfSize:14.0];
    imgLabel.textColor = [UIColor whiteColor];
    [imgLabel sizeToFit];
    NSTextAttachment *leftAttach = [NSTextAttachment new];
    leftAttach.image = [self imageWithUIView:imgLabel];
    leftAttach.bounds = CGRectMake(0, 0, imgLabel.width, imgLabel.height);
    NSAttributedString *imgStr2 = [NSAttributedString attributedStringWithAttachment:leftAttach];
    NSMutableAttributedString *imgLabelStr = [[NSMutableAttributedString alloc]initWithString:label.text];
    [imgLabelStr insertAttributedString:imgStr2 atIndex:0];
    label.attributedText = imgLabelStr;
}

//view转成image
- (UIImage*)imageWithUIView:(UIView*) view{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}

@end
