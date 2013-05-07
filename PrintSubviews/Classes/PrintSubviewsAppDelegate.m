/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PrintSubviewsAppDelegate.m
//  PrintSubviews
//
//  Created by Matt Drance on 11/18/09.
//  Copyright Bookhouse Software, LLC 2009. All rights reserved.
//

#import "PrintSubviewsAppDelegate.h"
#import "PrintSubviewsViewController.h"

@implementation PrintSubviewsAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
