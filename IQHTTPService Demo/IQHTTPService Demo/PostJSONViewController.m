//
//  PostJSONViewController.m
//  IQHTTPService Demo
//
//  Created by Indresh on 23/01/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

#import "PostJSONViewController.h"
#import "TestHTTPService.h"

@interface PostJSONViewController ()
{
    IBOutlet UILabel *labelRequest;
    IBOutlet UILabel *labelInfo;
    NSDictionary *requestDict;
}

@end

@implementation PostJSONViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    requestDict = @{@"Key1":@"Value1",@"Key2":@"Value2",@"Key3":@"Value3"};
    labelRequest.text = [NSString stringWithFormat:@"%@",requestDict];
}

- (IBAction)requestAction:(UIButton *)sender {

    [[TestHTTPService service] postJSONWithParameters:requestDict completionBlock:^(NSDictionary *result, NSError *error) {
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
