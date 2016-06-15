//
//  IQHTTPService.h
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


#import <Foundation/Foundation.h>
#import "IQHTTPConstants.h"
#import "IQMultipartFormData.h"
#import "IQURLConnection.h"

@interface IQHTTPService : NSObject

///--------------------------
/// @name Singleton Instance
///--------------------------

+(instancetype _Nonnull)service;



///--------------------------
/// @name Subclasses only
///--------------------------

/**
 @required Subclass must override this method and return the API path override this method.
 */
-( NSString* _Nonnull)endpointAPIPathString;

/**
 @optional Use this method to filter response json response according to needs
 */
+(void)filterResult:(id _Nullable * _Nullable)dict error:(NSError* _Nullable * _Nullable)error response:(NSHTTPURLResponse* _Nullable)response;



///--------------------------
/// @name Debugging
///--------------------------

/**
 If YES then print all request/response logs on console
 */
@property(nonatomic, assign, getter = isLogEnabled) BOOL logEnabled;



///--------------------------
/// @name Reqeust customisation
///--------------------------

/**
 IQRequestParameterTypeApplicationJSON If you want to send httpBody in json form.
 IQRequestParameterTypeApplicationXWwwFormUrlEncoded If you want to send httpBody in & seprated form.
 */
@property(nonatomic, assign) IQRequestParameterType parameterType;

/**
 Default Content-Type for all requests.
 */
@property(nullable, nonatomic, retain) NSString *defaultContentType;



///--------------------------
/// @name Default Headers
///--------------------------

/**
 Default headers for all http request
 */
@property(nonnull, nonatomic, retain) NSMutableDictionary <NSString *, NSString *> *defaultHeaders;

/**
 Set Basic authorization header in defaultHeaders
 */
-(void)setAuthorizationHeaderWithUsername:(NSString * _Nonnull)username password:(NSString * _Nonnull)password;

/**
 Set Token authorization header in defaultHeaders
 */
-(void)setAuthorizationHeaderWithToken:(NSString * _Nonnull)token;



///----------------------------
/// @name Asynchronous Requests
///----------------------------

/**
 [requestWithPath:(NSString*) httpMethod:(NSString*) parameter:(NSDictionary*) completionHandler:(IQDictionaryCompletionBlock)];
 */
-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                  parameter:(NSDictionary <NSString *, id> * _Nullable)parameter
                          completionHandler:(IQDictionaryCompletionBlock _Nullable)completionHandler;

/**
 [requestWithPath:(NSString*) httpMethod:(NSString*) contentType:(NSString*) httpBody:(NSData*) completionHandler:(IQDictionaryCompletionBlock)];
 */
-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                contentType:(NSString* _Nullable)contentType
                                   httpBody:(NSData* _Nullable)httpBody
                          completionHandler:(IQDictionaryCompletionBlock _Nullable)completionHandler;

/**
 [requestWithPath:(NSString*) httpMethod:(NSString*) contentType:(NSString*) httpBody:(NSData*) dataCompletionHandler:(IQURLConnectionDataCompletionBlock)];
 */
-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                contentType:(NSString* _Nullable)contentType
                                   httpBody:(NSData* _Nullable)httpBody
                      dataCompletionHandler:(IQURLConnectionDataCompletionBlock _Nullable)completionHandler;

///---------------------------------
/// @name Asynchronous File Requests
///---------------------------------

/**
 [requestWithPath:(NSString*) httpMethod:(NSString*) parameter:(NSDictionary*) multipartFormDatas:(NSArray*) completionHandler:(IQDictionaryCompletionBlock)];
 */
-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                  parameter:(NSDictionary <NSString *, id> * _Nullable)parameter
                         multipartFormDatas:(NSArray <IQMultipartFormData *>  * _Nonnull)multipartFormDatas
                          completionHandler:(IQDictionaryCompletionBlock _Nullable)completionHandler;

/**
 [requestWithPath:(NSString*) httpMethod:(NSString*) parameter:(NSDictionary*) multipartFormDatas:(NSArray*) dataCompletionHandler:(IQURLConnectionDataCompletionBlock)];
 */
-(IQURLConnection* _Nonnull)requestWithPath:(NSString* _Nonnull)path
                                 httpMethod:(NSString* _Nullable)method
                                  parameter:(NSDictionary* _Nullable)parameter
                         multipartFormDatas:(NSArray <IQMultipartFormData *>  * _Nonnull)multipartFormDatas
                      dataCompletionHandler:(IQURLConnectionDataCompletionBlock _Nullable)completionHandler;

@end
