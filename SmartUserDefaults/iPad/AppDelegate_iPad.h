/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  AppDelegate_iPad.h
//  SmartUserDefaults
//
//  Created by Matt Drance on 8/27/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DemoAppDelegate.h"

@interface AppDelegate_iPad : DemoAppDelegate <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

