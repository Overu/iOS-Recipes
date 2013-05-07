/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  DemoAppDelegate.m
//  SmartUserDefaults
//
//  Created by Matt Drance on 3/17/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "DemoAppDelegate.h"


@implementation DemoAppDelegate

- (void)registerDefaults {
    NSString *prefs = [[NSBundle mainBundle] pathForResource:@"Prefs" 
                                                      ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:prefs];
    NSDictionary *defaults = [dict valueForKey:@"defaults"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
