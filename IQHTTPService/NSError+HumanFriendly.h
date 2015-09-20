//
//  NSError+HumanFriendly.h
//  HabitApp
//
//  Created by Iftekhar on 13/08/15.
//  Copyright (c) 2015 InfoEnum02. All rights reserved.
//

#import <UIKit/UIKit.h>

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

enum
{
    NSURLServerErrorInternalServerError = 500,
    NSURLServerErrorNotImplemented = 501,
    NSURLServerErrorBadGateway = 502,
    NSURLServerErrorServiceUnavailable = 503,
    NSURLServerErrorGatewayTimeout = 504,
    NSURLServerErrorHTTPVersionNotSupported = 505,
};

extern NSString *const kServiceUnavailableFriendlyDescription;
extern NSString *const kBadResponseFriendlyDescription;

@interface NSError (HumanFriendly)

-(NSString*)humanFriendlyTitle;
-(NSString*)humanFriendlyDescription;
//-(UIImage*) humanFriendlyIcon;
@end
