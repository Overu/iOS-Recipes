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
//  BasicSplashScreen
//
//  Created by Matt Drance on 10/1/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "AppDelegate_iPhone.h"

@implementation AppDelegate_iPhone

@synthesize window;
@synthesize navController;
@synthesize splashController;

#pragma mark -
#pragma mark Application lifecycle

- (void)addSplashScreen {
	
    splashController = [[PRPSplashScreenViewController alloc] init];
	self.splashController.delegate = self;
	self.splashController.transition = ClearFromLeft;
	self.splashController.delay = 1.0;
    [self.splashController showInWindow:window];	
}


- (BOOL)application:(UIApplication *)application 
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self.window addSubview:self.navController.view];
    
	[self addSplashScreen];
	
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)splashScreenDidDisappear:(PRPSplashScreenViewController *)splashScreen {

	// looping through the transitions for demostration
	// this should be a release of the splashscreenviewcontroller
	
	if (self.splashController.transition == ClearFromLeft) 
		self.splashController.transition = ClearFromRight;
	else if (self.splashController.transition == ClearFromRight) 
		self.splashController.transition = ClearFromTop;
	else if (self.splashController.transition == ClearFromTop) 
		self.splashController.transition = ClearFromBottom;
	else if (self.splashController.transition == ClearFromBottom) 
		self.splashController.transition = ClearFromCenter;	
	else if (self.splashController.transition == ClearFromCenter) 
		self.splashController.transition = CircleFromCenter;
	else if (self.splashController.transition == CircleFromCenter) 
		self.splashController.transition = ClearFromLeft;
	
    [self.splashController showInWindow:window];	
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [splashController.view removeFromSuperview];
    [splashController release];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	[self addSplashScreen];
    
}


- (void)dealloc {
    [window release], window = nil;
    [navController release], navController = nil;
    [splashController release], splashController = nil;
    [super dealloc];
}


@end
