//
//  IQHTTPService.m
// https://github.com/hackiftekhar/IQHTTPService
// Copyright (c) 2013-16 Iftekhar Qurashi.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "IQHTTPService.h"

@implementation IQHTTPService

//Subclass must override this method and return the API path override this method.
-(NSString*)endpointAPIPathString
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ method in %@ class",NSStringFromSelector(_cmd),NSStringFromClass([self class])];
    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _defaultHeaders = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+(instancetype)service
{
    static NSMutableDictionary *sharedDictionary;
    
    if (sharedDictionary == nil)    sharedDictionary = [[NSMutableDictionary alloc] init];
    
    id sharedObject = [sharedDictionary objectForKey:NSStringFromClass([self class])];
    
    if (sharedObject == nil)
    {
        @synchronized(self) {
            
            //Again trying (May be set from another thread)
            id sharedObject = [sharedDictionary objectForKey:NSStringFromClass([self class])];
            
            if (sharedObject)
            {
                return sharedObject;
            }
            else if (![NSStringFromClass(self) isEqualToString:NSStringFromClass([IQHTTPService class])])
            {
                sharedObject = [[self alloc] init];
                
                [sharedDictionary setObject:sharedObject forKey:NSStringFromClass([self class])];
            }
            else
            {
                [NSException raise:NSInternalInconsistencyException format:@"You must subclass %@",NSStringFromClass([IQHTTPService class])];
                return nil;
            }
        }
    }
    
    return sharedObject;
}

-(BOOL)isLogEnabled
{
    return _logEnabled;
}

+(void)filterResult:(id _Nullable * _Nullable)dict error:(NSError* _Nullable * _Nullable)error response:(NSHTTPURLResponse* _Nullable)response
{

}

-(void)setAuthorizationHeaderWithUsername:(NSString *)username password:(NSString *)password
{
    NSString *base64String = [NSString stringWithFormat:@"%@:%@", username, password];
    
	NSData *authData = [base64String dataUsingEncoding:NSUTF8StringEncoding];
    
    if ([authData respondsToSelector:@selector(base64EncodedStringWithOptions:)])
    {
        base64String = [authData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    else if ([authData respondsToSelector:@selector(base64Encoding)])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        base64String = [authData base64Encoding];
#pragma clang diagnostic pop
    }
    
    [self.defaultHeaders setObject:[NSString stringWithFormat:@"Basic %@", base64String] forKey:kIQAuthorization];
}

-(void)setAuthorizationHeaderWithToken:(NSString *)token;
{
    [self.defaultHeaders setObject:[NSString stringWithFormat:@"Token token=\"%@\"", token] forKey:kIQAuthorization];
}



///----------------------------
/// @name Private helpers
///----------------------------

-(IQURLConnection*)requestWithURL:(NSURL*)url
                       httpMethod:(NSString*)method
                      contentType:(NSString*)contentType
                         httpBody:(NSData*)httpBody
            dataCompletionHandler:(IQURLConnectionDataCompletionBlock)completionHandler
{
    NSMutableURLRequest *request = [IQHTTPService requestWithURL:url httpMethod:method contentType:contentType body:httpBody];
    
    //Adding headers
    {
        [request setAllHTTPHeaderFields:self.defaultHeaders];
    }
    
    if (_logEnabled)
    {
        printHTTPRequest(request);
    }
    
    __block IQURLConnection *connection = [IQURLConnection sendAsynchronousRequest:request responseBlock:NULL uploadProgressBlock:NULL downloadProgressBlock:NULL completionHandler:^(NSData *result, NSError *error) {
        
        if (_logEnabled)
        {
            printURLConnection(connection);
        }
        
        if (completionHandler != NULL)
        {
            completionHandler(result, error);
        }
    }];
    
    completionHandler = NULL;
    
    return connection;
}

#pragma mark -
#pragma mark - Private Helper methods

+(NSMutableURLRequest*)requestWithURL:(NSURL*)url
                           httpMethod:(NSString*)httpMethod
                          contentType:(NSString*)contentType
                                 body:(NSData*)body
{
    if (url != nil)
    {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:300];
        
        if ([httpMethod length])    [request setHTTPMethod:httpMethod];
        if ([contentType length])   [request addValue:contentType forHTTPHeaderField:kIQContentType];
        if ([body length])
        {
            [request setHTTPBody:body];
            [request addValue:[NSString stringWithFormat:@"%lu",(unsigned long)[body length]] forHTTPHeaderField:kIQContentLength];
        }
        return request;
    }
    else
    {
        return nil;
    }
}

///----------------------------
/// @name Asynchronous Requests
///----------------------------

-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                  parameter:(NSDictionary* _Nullable)parameter
                          completionHandler:(IQDictionaryCompletionBlock _Nullable)completionHandler
{
    NSURL *url = nil;
    NSData *httpBody = nil;
    
    if ([method isEqualToString:kIQHTTPMethodGET])
    {
        NSMutableString *parameterString = [[NSMutableString alloc] init];
        if ([path hasSuffix:@"?"] == NO && [parameter count])
            [parameterString appendString:@"?"];
        
        [parameterString appendString:httpURLEncodedString(parameter)];
        
        url = [NSURL URLWithString:[[NSString stringWithFormat:@"%@%@%@",[self endpointAPIPathString],path,parameterString] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    }
    else if ([method isEqualToString:kIQHTTPMethodPOST] || [method isEqualToString:kIQHTTPMethodPUT] || [method isEqualToString:kIQHTTPMethodDELETE] || [method isEqualToString:kIQHTTPMethodPATCH] || [method isEqualToString:kIQHTTPMethodHEAD])
    {
        url = [NSURL URLWithString:[[NSString stringWithFormat:@"%@%@",[self endpointAPIPathString],path] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        
        NSData *originalData;
        
        if (self.parameterType == IQRequestParameterTypeApplicationJSON)
        {
            if (parameter)  originalData = [NSJSONSerialization dataWithJSONObject:parameter options:0 error:nil];
        }
        else if (self.parameterType == IQRequestParameterTypeApplicationXWwwFormUrlEncoded)
        {
            if (parameter)
            {
                originalData = httpURLEncodedData(parameter);
            }
        }
        
        if ([originalData length])
        {
            NSMutableData *editedData = [[NSMutableData alloc] init];
            
            if (originalData)       [editedData appendData:originalData];
            
            httpBody = editedData;
        }
    }
    
    __block IQURLConnection *connection = [self requestWithURL:url httpMethod:method contentType:self.defaultContentType httpBody:httpBody dataCompletionHandler:^(NSData *result, NSError *error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:0 error:nil];
        
        [[self class] filterResult:&dict error:&error response:connection.response];
        
        if (completionHandler)
        {
            completionHandler(dict,error);
        }
    }];

    return connection;
}

-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                contentType:(NSString* _Nullable)contentType
                                   httpBody:(NSData* _Nullable)httpBody
                          completionHandler:(IQDictionaryCompletionBlock _Nullable)completionHandler
{
    NSURL *url = [NSURL URLWithString:[[NSString stringWithFormat:@"%@%@",[self endpointAPIPathString],path] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];

    __block IQURLConnection *connection = [self requestWithURL:url httpMethod:method contentType:contentType httpBody:httpBody dataCompletionHandler:^(NSData *result, NSError *error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:0 error:nil];
        
        [[self class] filterResult:&dict error:&error response:connection.response];
        
        if (completionHandler)
        {
            completionHandler(dict,error);
        }
    }];
    
    return connection;
}

///----------------------------
/// @name Asynchronous File Requests
///----------------------------

-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                  parameter:(NSDictionary* _Nullable)parameter
                         multipartFormDatas:(NSArray <IQMultipartFormData *>  * _Nonnull)multipartFormDatas
                          completionHandler:(IQDictionaryCompletionBlock _Nullable)completionHandler
{
    NSString *boundary = generateRandomBoundaryString();
    
    NSMutableString *loggingMultipartString = [[NSMutableString alloc] init];  //  For logging purpose
    
    //Set HTTPBody
    __block NSMutableString *parameterAttributes = [[NSMutableString alloc] init];
    
    //Append Key-Value
    [parameter enumerateKeysAndObjectsUsingBlock:^(NSString *parameterKey, NSString *parameterValue, BOOL *stop)
     {
         [parameterAttributes appendFormat:@"--%@\r\n",boundary];
         [parameterAttributes appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",parameterKey];
         [parameterAttributes appendFormat:@"%@\r\n",parameterValue];
     }];
    
    NSMutableData *fileParameterData = [NSMutableData data];
    [loggingMultipartString appendString:parameterAttributes];
    
    for (IQMultipartFormData *formData in multipartFormDatas)
    {
        NSMutableString *attributes = [[NSMutableString alloc] initWithFormat:@"--%@\r\n",boundary];
        [attributes appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",formData.keyName,formData.fileName];
        [attributes appendFormat:@"Content-Type: %@\r\n",formData.mimeType];
        
        for (NSString *key in formData.additionalFileAttributes)
        {
            NSString *value = [formData.additionalFileAttributes objectForKey:key];
            [attributes appendFormat:@"%@: %@\r\n",key,value];
        }
        
        [attributes appendString:@"\r\n"];
        
        
        [fileParameterData appendData:[attributes dataUsingEncoding:NSUTF8StringEncoding]];
        [fileParameterData appendData:formData.data];
        [fileParameterData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        [loggingMultipartString appendString:attributes];
        [loggingMultipartString appendFormat:@"*** Raw Data of %@ ***",formData.fileName];
        [loggingMultipartString appendString:@"\r\n"];
    }
    
    NSString *closingBoundaryString = [NSString stringWithFormat:@"--%@--\r\n", boundary];
    [loggingMultipartString appendString:closingBoundaryString];
    
    NSMutableData *httpBody = [NSMutableData data];
    [httpBody appendData:[parameterAttributes dataUsingEncoding:NSUTF8StringEncoding]];
    [httpBody appendData:fileParameterData];
    [httpBody appendData:[closingBoundaryString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *contentType =[NSString stringWithFormat:@"%@; %@=%@",kIQContentTypeMultipartFormData, kIQContentTypeBoundary, boundary];

    return [self requestWithPath:path httpMethod:method contentType:contentType httpBody:httpBody completionHandler:completionHandler];
}

@end

