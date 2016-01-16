//
//  TestHTTPService.m
//  IQHTTPService Demo
//
//  Created by Indresh on 23/01/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

#import "TestHTTPService.h"

NSString *const kTestAPIErrorDomain              =   @"API";

NSString *const kTestAPIStatus                      =   @"status";
NSString *const kTestAPIError                       =   @"error";
NSString *const kTestAPIErrors                      =   @"errors";
NSString *const kTestAPIMessage                     =   @"message";

@implementation TestHTTPService

-(NSString*)endpointAPIPathString
{
    return @"http://localhost/TestHTTPServicePHP";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.logEnabled = YES;
        self.parameterType = IQRequestParameterTypeApplicationXWwwFormUrlEncoded;
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
    return [self requestWithPath:@"/fileUpload/" httpMethod:kIQHTTPMethodPOST parameter:parameters multipartFormDatas:multipartFiles completionHandler:completionBlock];
}

+(void)filterResult:(id*)dict error:(NSError**)error response:(NSHTTPURLResponse*)response
{
}

@end
