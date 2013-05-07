/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  AppDelegate_iPad.m
//  SmartWebView
//
//  Created by Matt Drance on 6/30/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import "AppDelegate_iPad.h"

@implementation AppDelegate_iPad

@synthesize window;
@synthesize mainViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch.
    [self.window addSubview:self.mainViewController.view];
    [self.window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
    [window release];
    [mainViewController release], mainViewController = nil;
    [super dealloc];
}


@end
