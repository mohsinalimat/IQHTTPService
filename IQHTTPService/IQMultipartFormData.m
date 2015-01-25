//
//  IQMultipartFormData.m
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

#import "IQMultipartFormData.h"
#import "IQHTTPConstants.h"

@implementation IQMultipartFormData

+(instancetype)multipartDataWithKeyName:(NSString*)keyName fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType
{
    return [[IQMultipartFormData alloc] initWithWithKeyName:keyName fileName:fileName data:data mimeType:mimeType];
}

+(instancetype)multipartDataWithKeyName:(NSString*)keyName fileAtPath:(NSString*)filePath
{
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    NSString *mimeType = MIMETypeForFileAtPath(filePath);
    NSString* fileName = [filePath lastPathComponent];
                             
    return [IQMultipartFormData multipartDataWithKeyName:keyName fileName:fileName data:data mimeType:mimeType];
}

-(instancetype)initWithWithKeyName:(NSString *)keyName fileName:(NSString *)fileName data:(NSData *)data mimeType:(NSString *)mimeType
{
    if (self = [super init])
    {
        NSAssert(keyName != nil, @"keyName must not be nil.");
        NSAssert(data != nil, @"data must not be nil.");
        NSAssert(fileName != nil, @"fileName must not be nil.");
        NSAssert(mimeType != nil, @"mimeType must not be nil.");
        
        _keyName = keyName;
        _fileName = fileName;
        _data = data;
        _mimeType = mimeType;
    }
    
    return self;
}

@end


