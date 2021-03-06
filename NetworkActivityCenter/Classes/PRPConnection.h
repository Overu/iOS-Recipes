/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPConnection.h
//  SimpleDownload
//
//  Created by Matt Drance on 3/1/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPConnection;

typedef void (^PRPConnectionProgressBlock)(PRPConnection *connection);
typedef void (^PRPConnectionCompletionBlock)(PRPConnection *connection, 
                                             NSError *error);



@interface PRPConnection : NSObject {}

@property (nonatomic, copy, readonly) NSURL *url;
@property (nonatomic, copy, readonly) NSURLRequest *urlRequest;

@property (nonatomic, assign, readonly) NSInteger contentLength;
@property (nonatomic, retain, readonly) NSMutableData *downloadData;
@property (nonatomic, assign, readonly) float percentComplete;
@property (nonatomic, assign) NSUInteger progressThreshold;


+ (id)connectionWithURL:(NSURL *)requestURL
          progressBlock:(PRPConnectionProgressBlock)progress
        completionBlock:(PRPConnectionCompletionBlock)completion;

+ (id)connectionWithRequest:(NSURLRequest *)request
              progressBlock:(PRPConnectionProgressBlock)progress
            completionBlock:(PRPConnectionCompletionBlock)completion;

- (id)initWithURL:(NSURL *)requestURL
    progressBlock:(PRPConnectionProgressBlock)progress
  completionBlock:(PRPConnectionCompletionBlock)completion;

- (id)initWithRequest:(NSURLRequest *)request
        progressBlock:(PRPConnectionProgressBlock)progress
      completionBlock:(PRPConnectionCompletionBlock)completion;

- (void)start;
- (void)stop;

@end