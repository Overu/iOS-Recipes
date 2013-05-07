/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  AppDelegate_iPhone.m
//  MultipartHTTPPost
//
//  Created by Matt Drance on 9/21/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "AppDelegate_iPhone.h"
#import "PRPMultipartPOSTRequest.h"

@implementation AppDelegate_iPhone

@synthesize window;
@synthesize request;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [window makeKeyAndVisible];
    [self upload:nil];
    return YES;
}

- (void)upload:(id)sender {
    NSString *URLString = @"http://localhost:3000/upload";
    self.request = [PRPMultipartPOSTRequest 
                    requestWithURL:[NSURL URLWithString:URLString]];
    self.request.HTTPBoundary = @"d0ntcr055t3h57r33m2";
    NSMutableDictionary *params;
    params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              @"Tyler", @"name",
              @"Soap salesman", @"occupation",
              nil];
    self.request.formParameters = params;
    
    NSString *imgFile = [[NSBundle mainBundle] 
                         pathForResource:@"pic" ofType:@"jpg"];
    [self.request setUploadFile:imgFile
                    contentType:@"image/jpeg"
                      nameParam:@"filedata"
                       filename:@"uploadedPic.jpg"];
    
    PRPBodyCompletionBlock completionBlock;
    completionBlock = ^(PRPMultipartPOSTRequest *req) {
        NSLog(@"Completion Block!");
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *responseData;
        responseData = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        if ([responseData length] > 0) {            
            NSLog(@"Upload response: %@", 
                  [NSString stringWithCString:[responseData bytes]
                                     encoding:NSUTF8StringEncoding]);        
        } else {
            NSLog(@"Bad response (%@)", responseData);
        }
    };
    PRPBodyErrorBlock errBlk = ^(PRPMultipartPOSTRequest *req, 
                                     NSError *error) {
        NSLog(@"ERROR BLOCK (%@)", error);
    };
    
    [self.request prepareForUploadWithCompletionBlock:completionBlock 
                                           errorBlock:errBlk];
}

- (void)dealloc {
    [window release];
    [request release], request = nil;
    [super dealloc];
}


@end
