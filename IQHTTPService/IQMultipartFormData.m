//
//  IQMultipartFormData.m
//  IQWebService Demo
//
//  Created by Iftekhar on 21/09/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "IQMultipartFormData.h"

@implementation IQMultipartFormData

+(instancetype)multipartDataWithName:(NSString*)name fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType
{
    IQMultipartFormData *multipartData = [[self alloc] init];
    multipartData.name = name;
    multipartData.fileName = fileName;
    multipartData.data = data;
    multipartData.mimeType = mimeType;

    return multipartData;
}

@end


