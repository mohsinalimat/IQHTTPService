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
    IBOutlet UILabel *labelInfo;
}

@end

@implementation HelloWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)requestAction:(UIButton *)sender {

    [[TestHTTPService service] helloWithParameters:@{@"name":@"HTTP Service"} CompletionBlock:^(NSDictionary *result, NSError *error) {
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
