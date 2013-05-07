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
#import "PRPSplashScreen.h"

@implementation AppDelegate_iPhone

@synthesize window;
@synthesize navController;
@synthesize splashScreen;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application 
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window addSubview:self.navController.view];
    self.splashScreen.showsStatusBarOnDismissal = YES;
    self.splashScreen.modalTransitionStyle = 
                                    UIModalTransitionStyleCrossDissolve;
    [self.navController presentModalViewController:splashScreen 
                                          animated:NO];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)splashScreenDidAppear:(PRPSplashScreen *)splashScreen {
    NSLog(@"splashScreenDidAppear!");
}

- (void)splashScreenWillDisappear:(PRPSplashScreen *)splashScreen {
    NSLog(@"splashScreenWillDisappear!");
}

- (void)splashScreenDidDisappear:(PRPSplashScreen *)splashScreen {
    self.splashScreen = nil;
}

- (void)dealloc {
    [window release], window = nil;
    [navController release], navController = nil;
    [splashScreen release], splashScreen = nil;
    [super dealloc];
}


@end
