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
    IBOutlet UILabel *labelInfo;
}

@end

@implementation PostJSONViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)requestAction:(UIButton *)sender {

    [[TestHTTPService service] postJSONWithParameters:@{@"Key1":@"Value1",@"Key2":@"Value2",@"Key3":@"Value3"} completionBlock:^(NSDictionary *result, NSError *error) {
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
