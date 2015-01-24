//
//  HelloWorldViewController.m
//  IQHTTPService Demo
//
//  Created by Indresh on 23/01/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "TestHTTPService.h"

@interface HelloWorldViewController ()
{
    IBOutlet UILabel *labelRequest;
    IBOutlet UILabel *labelInfo;
    NSDictionary *requestDict;
}

@end

@implementation HelloWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    requestDict = @{@"name":@"HTTP Service"};
    labelRequest.text = [NSString stringWithFormat:@"%@",requestDict];
}

- (IBAction)requestAction:(UIButton *)sender {

    [[TestHTTPService service] helloWithParameters:requestDict CompletionBlock:^(NSDictionary *result, NSError *error) {
        if (result)
        {
            labelInfo.text = [NSString stringWithFormat:@"%@",result];
            NSLog(@"Completion: %@", result);
        }
        else
        {
            NSLog(@"Error: %@", error);
        }
    }];
}

@end
