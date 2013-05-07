/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPMultipartPOSTRequest.h
//  MultipartHTTPPost
//
//  Created by Matt Drance on 9/21/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PRPMultipartPOSTRequest;

typedef void (^PRPBodyCompletionBlock)(PRPMultipartPOSTRequest *);
typedef void (^PRPBodyErrorBlock)(PRPMultipartPOSTRequest *, NSError *);

@interface PRPMultipartPOSTRequest : NSMutableURLRequest <NSStreamDelegate> {}

- (void)setUploadFile:(NSString *)path
          contentType:(NSString *)type
            nameParam:(NSString *)nameParam
             filename:(NSString *)fileName;

- (void)prepareForUploadWithCompletionBlock:(PRPBodyCompletionBlock)completion
                                 errorBlock:(PRPBodyErrorBlock)error;

@property (nonatomic, copy) NSString *HTTPBoundary;
@property (nonatomic, retain) NSDictionary *formParameters;

@end