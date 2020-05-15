//
//  ZPBrainTreeVC.m
//  teststronge
//
//  Created by OS on 2020/1/13.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPBrainTreeVC.h"
#import "BraintreeCore.h"
#import "BraintreeDropIn.h"
#import "ZPToast.h"
@interface ZPBrainTreeVC ()
@property (nonatomic,strong)NSString *clientToken;
//@property (nonatomic,copy)void (^successBlock)(void);
@end

@implementation ZPBrainTreeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getclientToken:nil];
}

//获取clientToken的接口
- (void)getclientToken:(void(^)(void))successBlock{
    NSString *head = @"http://192.168.16.163/le3_api/public/api/v3";
    NSString *foot = @"/paypal/order/create";
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.url = [NSString stringWithFormat:@"%@%@",head,foot];
        request.httpMethod = kXMHTTPMethodGET;
//        request.parameters = @{};
        request.headers = @{@"userId" : @"63564179f319f8c226dec9ca8f99752d"};
    } onSuccess:^(id  _Nullable responseObject) {
        if ([responseObject[@"code"]integerValue] == 200) {
           self.clientToken = responseObject[@"data"][@"token"];
        }
        
    } onFailure:^(NSError * _Nullable error) {
        
    }];
}

//唤起支付界面
- (void)showDropIn:(NSString *)clientTokenOrTokenizationKey {
    BTDropInRequest *request = [[BTDropInRequest alloc] init];
    request.cardDisabled = YES;
    request.paypalDisabled = NO;
//    request.amount = @"10.0";  
    BTDropInController *dropIn = [[BTDropInController alloc] initWithAuthorization:clientTokenOrTokenizationKey request:request handler:^(BTDropInController * _Nonnull controller, BTDropInResult * _Nullable result, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@", error);
        } else if (result.cancelled) {
            NSLog(@"CANCELLED");
            [controller dismissViewControllerAnimated:YES completion:nil];
        } else {
            // Use the BTDropInResult properties to update your UI
            // result.paymentOptionType
            // result.paymentMethod
            // result.paymentIcon
            // result.paymentDescription
            BTPaymentMethodNonce *nonce = result.paymentMethod;
//            [self postNonceToServer:nonce.nonce];
        }
        
    }];
    [self presentViewController:dropIn animated:YES completion:nil];
}

#pragma mark - 支付点击事件
- (IBAction)paymentClick:(id)sender {
//    [self showDropIn:@"CLIENT_TOKEN_FROM_SERVER"];
    if (self.clientToken) {
        [self showDropIn:self.clientToken];
//        [BTDropInResult fetchDropInResultForAuthorization:self.clientToken handler:^(BTDropInResult * _Nullable result, NSError * _Nullable error) {
//            if (error) {
////                self.progressBlock([NSString stringWithFormat:@"Error: %@", error.localizedDescription]);
//                NSLog(@"Error: %@", error);
//            } else {
//                if (result.paymentOptionType == BTUIKPaymentOptionTypeApplePay) {
////                    self.progressBlock(@"Ready for checkout...");
////                    [self setupApplePay];
//                } else {
////                    self.useApplePay = NO;
////                    self.selectedNonce = result.paymentMethod;
////                    self.progressBlock(@"Ready for checkout...");
////                    [self updatePaymentMethod:self.selectedNonce];
//                }
//            }
//        }];
    }else{
        [self getclientToken:^{
            [self showDropIn:self.clientToken];
        }];
    }
   
}

//将noce传给后台,并支付订单
- (void)postNonceToServer:(NSString *)paymentMethodNonce {
    // Update URL with your server
//    NSURL *paymentURL = [NSURL URLWithString:@"https://your-server.example.com/checkout"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:paymentURL];
//    request.HTTPBody = [[NSString stringWithFormat:@"payment_method_nonce=%@", paymentMethodNonce] dataUsingEncoding:NSUTF8StringEncoding];
//    request.HTTPMethod = @"POST";
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        // TODO: Handle success and failure
//        NSString *clientToken = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    }] resume];
    
    NSString *head = @"http://192.168.16.163/le3_api/public/api/v3";
        NSString *foot = @"/paypal/order";
        [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
            request.url = [NSString stringWithFormat:@"%@%@",head,foot];
            request.httpMethod = kXMHTTPMethodPOST;
            request.parameters = @{@"ordernum":@"",
                                   @"cla":@"",
                                   @"paymentMethodNonce":paymentMethodNonce
            };
            request.headers = @{@"userId" : @"63564179f319f8c226dec9ca8f99752d"};
        } onSuccess:^(id  _Nullable responseObject) {
            if ([responseObject[@"code"]integerValue] == 200) {
                [ZPToast TextToastWithMessage:@"支付成功"];
            }else{
                
            }
            
        } onFailure:^(NSError * _Nullable error) {
            [ZPToast TextToastWithMessage:@"支付失败"];
            NSLog(@"%@",error);
        }];
}


//- (void)fetchClientToken {
//    // TODO: Switch this URL to your own authenticated API
//    NSURL *clientTokenURL = [NSURL URLWithString:@"https://braintree-sample-merchant.herokuapp.com/client_token"];
//    NSMutableURLRequest *clientTokenRequest = [NSMutableURLRequest requestWithURL:clientTokenURL];
//    [clientTokenRequest setValue:@"text/plain" forHTTPHeaderField:@"Accept"];
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:clientTokenRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSString *clientToken = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"token:%@",clientToken);
//        self.clientToken = clientToken;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self showDropIn:self.clientToken];
//        });
//
//    }] resume];
//}

//- (void)test:(NSString *)paymentMethodNonce merchantAccountId:(NSString *)merchantAccountId{
//    NSMutableDictionary *parameters;
//    parameters = [@{ @"payment_method_nonce": paymentMethodNonce } mutableCopy];
//    if (merchantAccountId != nil) {
//        [parameters setObject:merchantAccountId forKey:@"merchant_account_id"];
//    }
//}
@end
