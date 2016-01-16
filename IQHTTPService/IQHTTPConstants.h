//
//  IQHTTPConstants.h
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


@class UIImage, NSHTTPURLResponse, NSError, NSString, NSData, IQMultipartFormData, IQURLConnection;

/**
 Some useful Client error constants
 */
enum
{
    NSURLClientErrorBadRequest = 400,
    NSURLClientErrorUnauthorized = 401,
    NSURLClientErrorPaymentRequired = 402,
    NSURLClientErrorForbidden = 403,
    NSURLClientErrorNotFound = 404,
    NSURLClientErrorMethodNotAllowed = 405,
    NSURLClientErrorNotAcceptable = 406,
    NSURLClientErrorProxyAuthenticationRequired = 407,
    NSURLClientErrorRequestTimeout = 408,
    NSURLClientErrorConflict = 409,
    NSURLClientErrorGone = 410,
    NSURLClientErrorLengthRequired = 411,
    NSURLClientErrorPreconditionFailed = 412,
    NSURLClientErrorPayloadTooLarge = 413,
    NSURLClientErrorRequestURITooLong = 414,
    NSURLClientErrorUnsupportedMediaType = 415,
    NSURLClientErrorRequestedRangeNotSatisfiable = 416,
    NSURLClientErrorExpectationFailed = 417,
};

/**
 Some useful Server error constants
 */
enum
{
    NSURLServerErrorInternalServerError = 500,
    NSURLServerErrorNotImplemented = 501,
    NSURLServerErrorBadGateway = 502,
    NSURLServerErrorServiceUnavailable = 503,
    NSURLServerErrorGatewayTimeout = 504,
    NSURLServerErrorHTTPVersionNotSupported = 505,
};

/**
 `IQDictionaryCompletionBlock`
 Used for Dictionary callback when request is completed or failed.
 
 `IQURLConnectionResponseBlock`
 Used for sending response callback.
 
 `IQURLConnectionProgressBlock`
 Used for sending data upload/download callbacks.
 */
typedef void (^IQDictionaryCompletionBlock)(NSDictionary <NSString *, id> * _Nullable result, NSError* _Nullable error);

/**
 Request paramter type used to construct httpBody
 */
typedef enum IQRequestParameterType
{
    IQRequestParameterTypeApplicationJSON,
    IQRequestParameterTypeApplicationXWwwFormUrlEncoded,
}IQRequestParameterType;

#pragma mark - HTTP Header field constant strings
/*! @abstract @"Accept"  */
extern NSString* _Nonnull const kIQAccept;
/*! @abstract @"Accept-Charset"  */
extern NSString* _Nonnull const kIQAcceptCharset;
/*! @abstract @"Accept-Datetime"  */
extern NSString* _Nonnull const kIQAcceptDatetime;
/*! @abstract @"Accept-Encoding"  */
extern NSString* _Nonnull const kIQAcceptEncoding;
/*! @abstract @"Accept-Language"  */
extern NSString* _Nonnull const kIQAcceptLanguage;
/*! @abstract @"Accept-Ranges"  */
extern NSString* _Nonnull const kIQAcceptRanges;
/*! @abstract @"Authorization"  */
extern NSString* _Nonnull const kIQAuthorization;
/*! @abstract @"Cache-Control"  */
extern NSString* _Nonnull const kIQCacheControl;
/*! @abstract @"Connection"  */
extern NSString* _Nonnull const kIQConnection;
/*! @abstract @"Content-Encoding"  */
extern NSString* _Nonnull const kIQContentEncoding ;
/*! @abstract @"Content-MD5"  */
extern NSString* _Nonnull const kIQContentMD5;
/*! @abstract @"Content-Language"  */
extern NSString* _Nonnull const kIQContentLanguage;
/*! @abstract @"Content-Length"  */
extern NSString* _Nonnull const kIQContentLength;
/*! @abstract @"Content-Location"  */
extern NSString* _Nonnull const kIQContentLocation;
/*! @abstract @"Content-Range"  */
extern NSString* _Nonnull const kIQContentRange;
/*! @abstract @"Content-Type"  */
extern NSString* _Nonnull const kIQContentType;
/*! @abstract @"Cookie"  */
extern NSString* _Nonnull const kIQCookie;
/*! @abstract @"Date"  */
extern NSString* _Nonnull const kIQDate;
/*! @abstract @"Expires"  */
extern NSString* _Nonnull const kIQExpires;
/*! @abstract @"Host"  */
extern NSString* _Nonnull const kIQHost;
/*! @abstract @"@"Keep-Alive""  */
extern NSString* _Nonnull const kIQKeepAlive;
/*! @abstract @"Last-Modified"  */
extern NSString* _Nonnull const kIQLastModified;
/*! @abstract @"Proxy-Connection"  */
extern NSString* _Nonnull const kIQProxyConnection;
/*! @abstract @"Range"  */
extern NSString* _Nonnull const kIQRange;
/*! @abstract @"Referer"  */
extern NSString* _Nonnull const kIQReferer;
/*! @abstract @"Server"  */
extern NSString* _Nonnull const kIQServer;
/*! @abstract @"SOAPAction"  */
extern NSString* _Nonnull const kIQSOAPAction;
/*! @abstract @"Status"  */
extern NSString* _Nonnull const kIQStatus;
/*! @abstract @"User-Agent"  */
extern NSString* _Nonnull const kIQUserAgent;
/*! @abstract @"Via"  */
extern NSString* _Nonnull const kIQVia;
/*! @abstract @"X-Powered-By"  */
extern NSString* _Nonnull const kIQXPoweredBy;


#pragma mark - HTTP method constant strings
/*! @abstract @"POST"  */
extern NSString* _Nonnull const kIQHTTPMethodPOST;
/*! @abstract @"GET"  */
extern NSString* _Nonnull const kIQHTTPMethodGET;
/*! @abstract @"PUT"  */
extern NSString* _Nonnull const kIQHTTPMethodPUT;
/*! @abstract @"DELETE"  */
extern NSString* _Nonnull const kIQHTTPMethodDELETE;
/*! @abstract @"HEAD"  */
extern NSString* _Nonnull const kIQHTTPMethodHEAD;
/*! @abstract @"PATCH"  */
extern NSString* _Nonnull const kIQHTTPMethodPATCH;


#pragma mark - HTTP Content-Type constant strings
//For Multipurpose files
/*! @abstract @"application/x-www-form-urlencoded"  */
extern NSString* _Nonnull const kIQContentTypeApplicationXWwwFormUrlEncoded;
/*! @abstract @"application/json"  */
extern NSString* _Nonnull const kIQContentTypeApplicationJson;
/*! @abstract @"application/javascript"  */
extern NSString* _Nonnull const kIQContentTypeApplicationJavaScript;
/*! @abstract @"application/pdf"  */
extern NSString* _Nonnull const kIQContentTypeApplicationPdf;
/*! @abstract @"application/soap+xml"  */
extern NSString* _Nonnull const kIQContentTypeApplicationSoapXml;
/*! @abstract @"application/xml"  */
extern NSString* _Nonnull const kIQContentTypeApplicationXml;
/*! @abstract @"application/zip"  */
extern NSString* _Nonnull const kIQContentTypeApplicationZip;
//For Audio
/*! @abstract @"audio/basic"  */
extern NSString* _Nonnull const kIQContentTypeAudioBasic;
/*! @abstract @"audio/mp4"  */
extern NSString* _Nonnull const kIQContentTypeAudioMp4;
/*! @abstract @"audio/mpeg"  */
extern NSString* _Nonnull const kIQContentTypeAudioMpeg;
/*! @abstract @"audio/ogg"  */
extern NSString* _Nonnull const kIQContentTypeAudioOgg;
//For image
/*! @abstract @"image/gif"  */
extern NSString* _Nonnull const kIQContentTypeImageGif;
/*! @abstract @"image/jpeg"  */
extern NSString* _Nonnull const kIQContentTypeImageJpeg;
/*! @abstract @"image/png"  */
extern NSString* _Nonnull const kIQContentTypeImagePng;
//For message
/*! @abstract @"message/http"  */
extern NSString* _Nonnull const kIQContentTypeMessageHttp;
//For multipart
/*! @abstract @"multipart/mixed"  */
extern NSString* _Nonnull const kIQContentTypeMultipartMixed;
/*! @abstract @"multipart/alternative"  */
extern NSString* _Nonnull const kIQContentTypeMultipartAlternative;
/*! @abstract @"multipart/related"  */
extern NSString* _Nonnull const kIQContentTypeMultipartRelated;
/*! @abstract @"multipart/form-data"  */
extern NSString* _Nonnull const kIQContentTypeMultipartFormData;
/*! @abstract @@"boundary"  */
extern NSString* _Nonnull const kIQContentTypeBoundary;
/*! @abstract @"multipart/encrypted"  */
extern NSString* _Nonnull const kIQContentTypeMultipartEncrypted;
//For text
/*! @abstract @"text/cmd"  */
extern NSString* _Nonnull const kIQContentTypeTextCmd;
/*! @abstract @"text/css"  */
extern NSString* _Nonnull const kIQContentTypeTextCss;
/*! @abstract @"text/csv"  */
extern NSString* _Nonnull const kIQContentTypeTextCsv;
/*! @abstract @"text/html"  */
extern NSString* _Nonnull const kIQContentTypeTextHtml;
/*! @abstract @"text/javascript"  */
extern NSString* _Nonnull const kIQContentTypeTextJavaScript;
/*! @abstract @"text/plain"  */
extern NSString* _Nonnull const kIQContentTypeTextPlain;
/*! @abstract @"text/vcard"  */
extern NSString* _Nonnull const kIQContentTypeTextVCard;
/*! @abstract @"text/xml"  */
extern NSString* _Nonnull const kIQContentTypeTextXml;
//For video
/*! @abstract @"video/mpeg"  */
extern NSString* _Nonnull const kIQContentTypeVideoMpeg;
/*! @abstract @"video/mp4"  */
extern NSString* _Nonnull const kIQContentTypeVideoMp4;
/*! @abstract @"video/quicktime"  */
extern NSString* _Nonnull const kIQContentTypeVideoQuickTime;
/*! @abstract @"video/webm"  */
extern NSString* _Nonnull const kIQContentTypeVideoWebm;
/*! @abstract @"video/x-matroska"  */
extern NSString* _Nonnull const kIQContentTypeVideoXMatroska;
/*! @abstract @"video/x-ms-wmv"  */
extern NSString* _Nonnull const kIQContentTypeVideoXMsWmv;
/*! @abstract @"video/x-flv"  */
extern NSString* _Nonnull const kIQContentTypeVideoXFlv;
//For Charset
/*! @abstract @"charset=utf-8"  */
extern NSString* _Nonnull const kIQContentTypeCharsetUtf8;


extern void printHTTPRequest(NSURLRequest* _Nonnull request);
extern void printURLConnection(IQURLConnection* _Nonnull connection);

extern NSString* _Nonnull   httpURLEncodedString(NSDictionary <NSString *, id> * _Nonnull parameter);
extern NSData* _Nonnull     httpURLEncodedData(NSDictionary <NSString *, id>* _Nonnull parameter);
extern NSString* _Nullable  jsonEncodedString(NSDictionary <NSString *, id>* _Nonnull parameter);
extern NSData* _Nullable    jsonEncodedData(NSDictionary <NSString *, id>* _Nonnull parameter);

extern NSString* _Nonnull   MIMETypeForFileAtPath(NSString* _Nonnull  filePath);

extern NSString* _Nonnull   generateRandomBoundaryString(void);

