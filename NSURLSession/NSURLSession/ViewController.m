//
//  ViewController.m
//  NSURLSession
//
//  Created by iXiaobo on 14-11-21.
//  Copyright (c) 2014年 iXiaobo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
     NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://www.baidu.com"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                NSString *string = [[NSString alloc] initWithData:data encoding:NSStringEncodingConversionAllowLossy];
                NSLog(@"%@",string);
            }
        }

        
    }];
    
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
//    {
//        if (!error) {
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//            if (httpResponse.statusCode == 200) {
//                NSString *string = [[NSString alloc] initWithData:data encoding:NSStringEncodingConversionAllowLossy];
//                NSLog(@"%@",string);
//            }
//        }
//    }];
    [dataTask resume];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
