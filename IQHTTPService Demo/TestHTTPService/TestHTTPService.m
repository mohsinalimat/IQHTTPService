//
//  TestHTTPService.m
//  IQHTTPService Demo
//
//  Created by Indresh on 23/01/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

#import "TestHTTPService.h"
#import "NSError+HumanFriendly.h"

NSString *const kTestAPIErrorDomain              =   @"API";

NSString *const kTestAPIStatus                      =   @"status";
NSString *const kTestAPIError                       =   @"error";
NSString *const kTestAPIErrors                      =   @"errors";
NSString *const kTestAPIMessage                     =   @"message";

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

+(void)filterResult:(NSDictionary**)dict error:(NSError**)error response:(NSHTTPURLResponse*)response
{
    NSDictionary *readonlyDict = *dict;
    
    if (*error == nil)
    {
        NSUInteger statusCode = [response statusCode];
        
        if (statusCode == NSURLServerErrorServiceUnavailable)
        {
            *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:@{NSLocalizedDescriptionKey:kServiceUnavailableFriendlyDescription}];
            *dict = nil;
        }
        else if (readonlyDict == nil)
        {
            *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:@{NSLocalizedDescriptionKey:kBadResponseFriendlyDescription}];
        }
        else if (readonlyDict[kTestAPIError])
        {
            if (readonlyDict[kTestAPIStatus])
            {
                statusCode = [readonlyDict[kTestAPIStatus] integerValue];
            }
            
            *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:@{NSLocalizedDescriptionKey:[readonlyDict[kTestAPIError] copy]}];
            *dict = nil;
        }
        else if (readonlyDict[kTestAPIErrors])
        {
            if (readonlyDict[kTestAPIStatus])
            {
                statusCode = [readonlyDict[kTestAPIStatus] integerValue];
            }
            
            if ([readonlyDict[kTestAPIErrors] isKindOfClass:[NSString class]])
            {
                *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:@{NSLocalizedDescriptionKey:[readonlyDict[kTestAPIErrors] copy]}];
                *dict = nil;
            }
            else if ([readonlyDict[kTestAPIErrors] isKindOfClass:[NSDictionary class]])
            {
                NSDictionary *errorDict = readonlyDict[kTestAPIErrors];
                
                if ([errorDict[kTestAPIMessage] isKindOfClass:[NSString class]])
                {
                    *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:@{NSLocalizedDescriptionKey:[readonlyDict[kTestAPIErrors][kTestAPIMessage] copy]}];
                    *dict = nil;
                }
                else if ([errorDict count]>0)
                {
                    id key = [[errorDict allKeys] firstObject];
                    id value = errorDict[key];
                    
                    if ([value isKindOfClass:[NSString class]])
                    {
                        *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:@{NSLocalizedDescriptionKey:[value copy]}];
                        *dict = nil;
                    }
                    else if ([value isKindOfClass:[NSArray class]])
                    {
                        NSString *actualValue = [value firstObject];
                        *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:@{NSLocalizedDescriptionKey:[actualValue copy]}];
                        *dict = nil;
                    }
                }
            }
        }
    }
    else
    {
        NSError *readonlyError = *error;
        
        NSMutableDictionary *userInfo = [[readonlyError userInfo] mutableCopy];
        userInfo[NSLocalizedDescriptionKey] = readonlyError.humanFriendlyDescription;
        
        NSUInteger statusCode = [readonlyError code];
        
        *error = [NSError errorWithDomain:kTestAPIErrorDomain code:statusCode userInfo:userInfo];
        *dict = nil;
    }
}

@end
