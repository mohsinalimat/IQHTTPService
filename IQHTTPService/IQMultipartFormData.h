//
//  IQMultipartFormData.h
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

@interface IQMultipartFormData : NSObject

/**
 Create multipart form data object which is used to upload files to server
 */
+(instancetype _Nonnull)multipartDataWithKeyName:(NSString* _Nonnull)keyName
                                        fileName:(NSString* _Nonnull)fileName
                                            data:(NSData* _Nonnull)data
                                        mimeType:(NSString* _Nonnull)mimeType;

/**
 Create multipart form data object from the file at given filePath
 */
+(instancetype _Nonnull)multipartDataWithKeyName:(NSString* _Nonnull)keyName
                                      fileAtPath:(NSString* _Nonnull)filePath;

/**
 Create multipart form data object which is used to upload files to server
 */
-(instancetype _Nonnull)initWithWithKeyName:(NSString * _Nonnull)keyName
                                   fileName:(NSString * _Nonnull)fileName
                                       data:(NSData * _Nonnull)data
                                   mimeType:(NSString * _Nonnull)mimeType;

/**
 Key parameter for the server to identify file
 */
@property(nonnull, nonatomic, strong, readonly) NSString *keyName;

/**
 Proposed file name
 */
@property(nonnull, nonatomic, strong, readonly) NSString *fileName;

/**
 File Data which uploads to server
 */
@property(nonnull, nonatomic, strong, readonly) NSData *data;

/**
 MimeType of file
 */
@property(nonnull, nonatomic, strong, readonly) NSString *mimeType;

/**
 Additional file attributes
 */
@property(nonnull, nonatomic, strong) NSDictionary <NSString *, id> * additionalFileAttributes;

@end
