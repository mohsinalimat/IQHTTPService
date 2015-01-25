//
//  IQMultipartFormData.h
// https://github.com/hackiftekhar/IQHTTPService
// Copyright (c) 2013-14 Iftekhar Qurashi.
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

@interface IQMultipartFormData : NSObject

//All parameters are mendatory
+(instancetype)multipartDataWithKeyName:(NSString*)keyName fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType;
+(instancetype)multipartDataWithKeyName:(NSString*)keyName fileAtPath:(NSString*)filePath;

-(instancetype)initWithWithKeyName:(NSString *)keyName fileName:(NSString *)fileName data:(NSData *)data mimeType:(NSString *)mimeType;

@property(nonatomic, strong, readonly) NSString *keyName;
@property(nonatomic, strong, readonly) NSString *fileName;
@property(nonatomic, strong, readonly) NSData *data;
@property(nonatomic, strong, readonly) NSString *mimeType;
@property(nonatomic, strong) NSDictionary *additionalFileAttributes;

@end