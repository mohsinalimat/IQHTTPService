//
//  IQHTTPConstants.m
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


#import <Foundation/NSObjCRuntime.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "IQURLConnection.h"
#import "IQHTTPConstants.h"

@class NSString, NSData;

#pragma mark - HTTP Header field constant strings
NSString* _Nonnull const kIQAccept                                   =   @"Accept";
NSString* _Nonnull const kIQAcceptCharset                            =   @"Accept-Charset";
NSString* _Nonnull const kIQAcceptDatetime                           =   @"Accept-Datetime";
NSString* _Nonnull const kIQAcceptEncoding                           =   @"Accept-Encoding";
NSString* _Nonnull const kIQAcceptLanguage                           =   @"Accept-Language";
NSString* _Nonnull const kIQAcceptRanges                             =   @"Accept-Ranges";
NSString* _Nonnull const kIQAuthorization                            =   @"Authorization";
NSString* _Nonnull const kIQCacheControl                             =   @"Cache-Control";
NSString* _Nonnull const kIQConnection                               =   @"Connection";
NSString* _Nonnull const kIQContentEncoding                          =   @"Content-Encoding";
NSString* _Nonnull const kIQContentMD5                               =   @"Content-MD5";
NSString* _Nonnull const kIQContentLanguage                          =   @"Content-Language";
NSString* _Nonnull const kIQContentLength                            =   @"Content-Length";
NSString* _Nonnull const kIQContentLocation                          =   @"Content-Location";
NSString* _Nonnull const kIQContentRange                             =   @"Content-Range";
NSString* _Nonnull const kIQContentType                              =   @"Content-Type";
NSString* _Nonnull const kIQCookie                                   =   @"Cookie";
NSString* _Nonnull const kIQDate                                     =   @"Date";
NSString* _Nonnull const kIQExpires                                  =   @"Expires";
NSString* _Nonnull const kIQHost                                     =   @"Host";
NSString* _Nonnull const kIQKeepAlive                                =   @"Keep-Alive";
NSString* _Nonnull const kIQLastModified                             =   @"Last-Modified";
NSString* _Nonnull const kIQProxyConnection                          =   @"Proxy-Connection";
NSString* _Nonnull const kIQRange                                    =   @"Range";
NSString* _Nonnull const kIQReferer                                  =   @"Referer";
NSString* _Nonnull const kIQServer                                   =   @"Server";
NSString* _Nonnull const kIQSOAPAction                               =   @"SOAPAction";
NSString* _Nonnull const kIQStatus                                   =   @"Status";
NSString* _Nonnull const kIQUserAgent                                =   @"User-Agent";
NSString* _Nonnull const kIQVia                                      =   @"Via";
NSString* _Nonnull const kIQXPoweredBy                               =   @"X-Powered-By";


#pragma mark - HTTP Content-Type constant strings
//For Multipurpose files
NSString* _Nonnull const kIQContentTypeApplicationXWwwFormUrlEncoded =   @"application/x-www-form-urlencoded";
NSString* _Nonnull const kIQContentTypeApplicationJson               =   @"application/json";
NSString* _Nonnull const kIQContentTypeApplicationJavaScript         =   @"application/javascript";
NSString* _Nonnull const kIQContentTypeApplicationPdf                =   @"application/pdf";
NSString* _Nonnull const kIQContentTypeApplicationSoapXml            =   @"application/soap+xml";
NSString* _Nonnull const kIQContentTypeApplicationXml                =   @"application/xml";
NSString* _Nonnull const kIQContentTypeApplicationZip                =   @"application/zip";
//For Audio
NSString* _Nonnull const kIQContentTypeAudioBasic                    =   @"audio/basic";
NSString* _Nonnull const kIQContentTypeAudioMp4                      =   @"audio/mp4";
NSString* _Nonnull const kIQContentTypeAudioMpeg                     =   @"audio/mpeg";
NSString* _Nonnull const kIQContentTypeAudioOgg                      =   @"audio/ogg";
//For image
NSString* _Nonnull const kIQContentTypeImageGif                      =   @"image/gif";
NSString* _Nonnull const kIQContentTypeImageJpeg                     =   @"image/jpeg";
NSString* _Nonnull const kIQContentTypeImagePng                      =   @"image/png";
//For message
NSString* _Nonnull const kIQContentTypeMessageHttp                   =   @"message/http";
//For multipart
NSString* _Nonnull const kIQContentTypeMultipartMixed                =   @"multipart/mixed";
NSString* _Nonnull const kIQContentTypeMultipartAlternative          =   @"multipart/alternative";
NSString* _Nonnull const kIQContentTypeMultipartRelated              =   @"multipart/related";
NSString* _Nonnull const kIQContentTypeMultipartFormData             =   @"multipart/form-data";
NSString* _Nonnull const kIQContentTypeMultipartEncrypted            =   @"multipart/encrypted";
NSString* _Nonnull const kIQContentTypeBoundary                      =   @"boundary";
//For text
NSString* _Nonnull const kIQContentTypeTextCmd                       =   @"text/cmd";
NSString* _Nonnull const kIQContentTypeTextCss                       =   @"text/css";
NSString* _Nonnull const kIQContentTypeTextCsv                       =   @"text/csv";
NSString* _Nonnull const kIQContentTypeTextHtml                      =   @"text/html";
NSString* _Nonnull const kIQContentTypeTextJavaScript                =   @"text/javascript";
NSString* _Nonnull const kIQContentTypeTextPlain                     =   @"text/plain";
NSString* _Nonnull const kIQContentTypeTextVCard                     =   @"text/vcard";
NSString* _Nonnull const kIQContentTypeTextXml                       =   @"text/xml";
//For video
NSString* _Nonnull const kIQContentTypeVideoMpeg                     =   @"video/mpeg";
NSString* _Nonnull const kIQContentTypeVideoMp4                      =   @"video/mp4";
NSString* _Nonnull const kIQContentTypeVideoQuickTime                =   @"video/quicktime";
NSString* _Nonnull const kIQContentTypeVideoWebm                     =   @"video/webm";
NSString* _Nonnull const kIQContentTypeVideoXMatroska                =   @"video/x-matroska";
NSString* _Nonnull const kIQContentTypeVideoXMsWmv                   =   @"video/x-ms-wmv";
NSString* _Nonnull const kIQContentTypeVideoXFlv                     =   @"video/x-flv";
//for charset
NSString* _Nonnull const kIQContentTypeCharsetUtf8                   =   @"charset=utf-8";


#pragma mark - HTTP method constant strings
NSString* _Nonnull const kIQHTTPMethodPOST                           =   @"POST";
NSString* _Nonnull const kIQHTTPMethodGET                            =   @"GET";
NSString* _Nonnull const kIQHTTPMethodPUT                            =   @"PUT";
NSString* _Nonnull const kIQHTTPMethodDELETE                         =   @"DELETE";
NSString* _Nonnull const kIQHTTPMethodHEAD                           =   @"HEAD";
NSString* _Nonnull const kIQHTTPMethodPATCH                          =   @"PATCH";


void printHTTPRequest(NSURLRequest* _Nonnull request)
{
    NSMutableString *descriptionString = [[NSMutableString alloc] initWithString:@"HTTP Request:-"];
    
    [descriptionString appendFormat:@"\nURL:- %@",request.URL];
    [descriptionString appendFormat:@"\nMethod:- %@",request.HTTPMethod];
    
    if (request.allHTTPHeaderFields)
    {
        [descriptionString appendFormat:@"\nHeaders:- %@",request.allHTTPHeaderFields];
    }
    
    if (request.HTTPBody)
    {
        NSString *requestString = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
        
        if (requestString)
        {
            [descriptionString appendFormat:@"\nBody:- %@",request.allHTTPHeaderFields];
        }
        else
        {
            [descriptionString appendFormat:@"\nBody Length:- %lu",(unsigned long)[request.HTTPBody length]];
        }
    }
    
    NSLog(@"%@\n*********************************\n",descriptionString);
}

void printURLConnection(IQURLConnection* _Nonnull connection)
{
    NSMutableString *descriptionString = [[NSMutableString alloc] initWithString:@"HTTP Response:-"];
    
    [descriptionString appendFormat:@"\nURL:- %@",connection.originalRequest.URL];
    [descriptionString appendFormat:@"\nMethod:- %@",connection.originalRequest.HTTPMethod];
    
    if (connection.error)
    {
        [descriptionString appendFormat:@"\nError:- %@",connection.error];
    }
    
    if (connection.response)
    {
        [descriptionString appendFormat:@"\nHeaders:- %@",connection.response.allHeaderFields];
    }
    
    if (connection.responseData)
    {
        NSString *responseString = [[NSString alloc] initWithData:connection.responseData encoding:NSUTF8StringEncoding];
        
        if ([responseString length])
        {
            [descriptionString appendFormat:@"\nBody:- %@",responseString];
        }
        else
        {
            [descriptionString appendFormat:@"\nBody Length:- %lu",(unsigned long)[connection.responseData length]];
        }
    }

    NSLog(@"%@\n*********************************\n",descriptionString);
}


NSString* _Nonnull httpURLEncodedString(NSDictionary <NSString *, id> * _Nonnull parameter)
{
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (NSString *aKey in [parameter allKeys])
    {
        [values addObject:[NSString stringWithFormat:@"%@=%@",aKey,[parameter objectForKey:aKey]]];
    }
    
    return [values componentsJoinedByString:@"&"];
}

NSData* _Nonnull httpURLEncodedData(NSDictionary <NSString *, id> * _Nonnull parameter)
{
    return [httpURLEncodedString(parameter) dataUsingEncoding:NSUTF8StringEncoding];
}

NSString* _Nullable jsonEncodedString(NSDictionary <NSString *, id> * _Nonnull parameter)
{
    return [[NSString alloc] initWithData:jsonEncodedData(parameter) encoding:NSUTF8StringEncoding];
}

NSData* _Nullable jsonEncodedData(NSDictionary <NSString *, id> * _Nonnull parameter)
{
    return [NSJSONSerialization dataWithJSONObject:parameter options:0 error:nil];
}

NSString* _Nonnull MIMETypeForFileAtPath(NSString* _Nonnull  filePath)
{
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[filePath pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    
    if (!MIMEType) {
        return @"application/octet-stream";
    } else {
        return (__bridge NSString *)MIMEType;
    }
}

// generate boundary string
// adapted from http://developer.apple.com/library/ios/#samplecode/SimpleURLConnections
NSString* _Nonnull generateRandomBoundaryString(void)
{
    CFUUIDRef       uuid;
    CFStringRef     uuidStr;
    NSString *      result;
    
    uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    
    uuidStr = CFUUIDCreateString(NULL, uuid);
    assert(uuidStr != NULL);
    
    result = [NSString stringWithFormat:@"Boundary-%@", uuidStr];
    
    CFRelease(uuidStr);
    CFRelease(uuid);
    
    return result;
}
