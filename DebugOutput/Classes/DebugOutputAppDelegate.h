/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  DebugOutputAppDelegate.h
//  DebugOutput
//
//  Created by Matt Drance on 6/16/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DebugOutputAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

