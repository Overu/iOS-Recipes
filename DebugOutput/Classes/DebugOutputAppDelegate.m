/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  DebugOutputAppDelegate.m
//  DebugOutput
//
//  Created by Matt Drance on 6/16/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import "DebugOutputAppDelegate.h"
#import "PRPDebug.h"

@implementation DebugOutputAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    NSLog(@"This is an NSLog. A PRPLog may or may not follow depending on your build configuration.");

	PRPLog(@"This is a PRPLog sent from -[%@ %@]",
          NSStringFromClass([self class]),
          NSStringFromSelector(_cmd));
    
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
