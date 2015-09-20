#import "NSError+HumanFriendly.h"
#import <CoreLocation/CoreLocation.h>

NSString *const kRequestTimeoutFriendlyDescription          = @"Unable to reach servers (Timeout). Please try again.";
NSString *const kBadResponseFriendlyDescription             = @"Received an error from servers. Please try again.";
NSString *const kServiceUnavailableFriendlyDescription      = @"Unable to reach servers (service unavailable). Please try again.";
NSString *const kCannotFindHostFriendlyDescription          = @"Unable to reach servers (host not found). Please try again.";
NSString *const kSecureConnectionFailedFriendlyDescription  = @"Unable to connect securely with servers. Please try again.";
NSString *const kCannotConnectToHostFriendlyDescription     = @"Unable to reach connect with servers (can't connect to host). Please try again.";
NSString *const kNetworkConnectionLostFriendlyDescription   = @"Unable to reach servers (connection lost). Please try again.";
NSString *const kNotConnectedToInternetFriendlyDescription  = @"Your internet connection appears to be offline. Please try again.";

        
@implementation NSError (HumanFriendly)

//-(UIImage*)humanFriendlyIcon
//{
//    switch (self.code) {
//
//        case NSURLClientErrorRequestTimeout:
//        case NSURLServerErrorGatewayTimeout:
//        case NSURLErrorTimedOut:
//            return [UIImage imageNamed:@"cloud-error"];
//            break;
//        case NSURLServerErrorInternalServerError:
//        case NSURLErrorBadServerResponse:
//            return [UIImage imageNamed:@"cloud-error"];
//            break;
//
//        case NSURLServerErrorServiceUnavailable:
//        case NSURLErrorCannotFindHost:
//            return [UIImage imageNamed:@"cloud-offline"];
//            break;
//        case kCFURLErrorSecureConnectionFailed:
//            return [UIImage imageNamed:@"cloud-offline"];
//            break;
//        case NSURLErrorCannotConnectToHost:
//        case NSURLErrorNetworkConnectionLost:
//            return [UIImage imageNamed:@"cloud-offline"];
//            break;
//        case NSURLErrorNotConnectedToInternet:
//            return [UIImage imageNamed:@"cloud-offline"];
//            break;
//        default:
//            return nil;
//            break;
//    }
//}

-(NSString*)humanFriendlyTitle
{
    switch (self.code) {
            
        case NSURLClientErrorRequestTimeout:
        case NSURLServerErrorGatewayTimeout:
        case NSURLErrorTimedOut:
            return @"Timedout";
            break;
        case NSURLServerErrorInternalServerError:
        case NSURLErrorBadServerResponse:
            return @"Bad Response";
            break;
            
        case NSURLServerErrorServiceUnavailable:
            return @"Service unavailable";
            break;
        case NSURLErrorCannotFindHost:
            return @"Can't find host";
            break;
        case kCFURLErrorSecureConnectionFailed:
            return @"Connection failed";
            break;
        case NSURLErrorCannotConnectToHost:
            return @"Can't connect to host";
            break;
        case NSURLErrorNetworkConnectionLost:
            return @"Connection lost";
            break;
        case kCLErrorNetwork:
        case NSURLErrorNotConnectedToInternet:
            return @"Offline";
            break;
        default:
            return [self localizedDescription];
            break;
    }
}

-(NSString*)humanFriendlyDescription
{
    switch (self.code) {
            
        case NSURLClientErrorRequestTimeout:
        case NSURLServerErrorGatewayTimeout:
        case NSURLErrorTimedOut:
            return kRequestTimeoutFriendlyDescription;
            break;
        case NSURLServerErrorInternalServerError:
        case NSURLErrorBadServerResponse:
            return kBadResponseFriendlyDescription;
            break;
        case NSURLServerErrorServiceUnavailable:
            return kServiceUnavailableFriendlyDescription;
            break;
        case NSURLErrorCannotFindHost:
            return kCannotFindHostFriendlyDescription;
            break;
        case kCFURLErrorSecureConnectionFailed:
            return kSecureConnectionFailedFriendlyDescription;
            break;
        case NSURLErrorCannotConnectToHost:
            return kCannotConnectToHostFriendlyDescription;
            break;
        case NSURLErrorNetworkConnectionLost:
            return kNetworkConnectionLostFriendlyDescription;
            break;
        case kCLErrorNetwork:
        case NSURLErrorNotConnectedToInternet:
            return kNotConnectedToInternetFriendlyDescription;
            break;
        default:
            return [self localizedDescription];
            break;
    }
}

@end
