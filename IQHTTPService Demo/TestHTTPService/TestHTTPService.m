//
//  TestHTTPService.m
//  IQHTTPService Demo
//
//  Created by Indresh on 23/01/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

#import "TestHTTPService.h"

@implementation TestHTTPService

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.logEnabled = YES;
        self.parameterType = IQRequestParameterTypeApplicationXWwwFormUrlEncoded;
        self.serverURL = @"http://localhost/TestHTTPServicePHP";
    }
    return self;
}

-(IQURLConnection*)helloWithParameters:(NSDictionary*)parameters  CompletionBlock:(IQDictionaryCompletionBlock)completionBlock
{
    return [self requestWithPath:@"/helloWorld/" httpMethod:kIQHTTPMethodGET parameter:parameters completionHandler:completionBlock];
}

-(IQURLConnection*)postJSONWithParameters:(NSDictionary*)parameters completionBlock:(IQDictionaryCompletionBlock)completionBlock
{
    return [self requestWithPath:@"/postJson/" httpMethod:kIQHTTPMethodPOST parameter:parameters completionHandler:completionBlock];
}

-(IQURLConnection*)uploadFilesWithParameters:(NSDictionary*)parameters files:(NSArray*)multipartFiles completionBlock:(IQDictionaryCompletionBlock)completionBlock
{
    return [self requestWithPath:@"/fileUpload/" parameter:parameters multipartFormDatas:multipartFiles uploadProgressBlock:NULL completionHandler:completionBlock];
}

@end
