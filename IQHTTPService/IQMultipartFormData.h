//
//  IQMultipartFormData.h
//  IQWebService Demo
//
//  Created by Iftekhar on 21/09/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IQMultipartFormData : NSObject

+(instancetype)multipartDataWithName:(NSString*)name fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType;

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *fileName;
@property(nonatomic, strong) NSData *data;
@property(nonatomic, strong) NSString *mimeType;

@end
