/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  ScrollingCreditsAppDelegate.m
//  ScrollingCredits
//
//  Created by Paul Warren on 11/24/09.
//  Copyright Primitive Dog Software 2009. All rights reserved.
//

#import "ScrollingCreditsAppDelegate.h"
#import "PRPScrollingTextViewController.h"

@implementation ScrollingCreditsAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch
    viewController.scrollText = @"Recipe IV\n\nA new Book\n\nThe new iOS Recipes Book is simply one of the best resources for discovering the techniques you need to make your iOS app stand out from the crowd.\n\n\nThank You\n\n\n\n\n\n\n\n\n\n";

    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
