//
//  TestHTTPService.h
//  IQHTTPService Demo
//
//  Created by Indresh on 23/01/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

#import "IQHTTPService.h"

@interface TestHTTPService : IQHTTPService

-(IQURLConnection*)helloWithParameters:(NSDictionary*)parameters  CompletionBlock:(IQDictionaryCompletionBlock)completionBlock;

-(IQURLConnection*)postJSONWithParameters:(NSDictionary*)parameters completionBlock:(IQDictionaryCompletionBlock)completionBlock;

-(IQURLConnection*)uploadFilesWithParameters:(NSDictionary*)parameters files:(NSArray*)multipartFiles completionBlock:(IQDictionaryCompletionBlock)completionBlock;

@end
