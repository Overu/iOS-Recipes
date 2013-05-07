/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  NetworkActivityCenterAppDelegate.m
//  NetworkActivityCenter
//
//  Created by Matt Drance on 3/1/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import "NetworkActivityAppDelegate.h"

@implementation NetworkActivityAppDelegate

@synthesize window;
@synthesize navController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [navController release];
    [window release];
    [super dealloc];
}


@end
