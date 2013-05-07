/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  ScrollingCreditsAppDelegate.h
//  ScrollingCredits
//
//  Created by Paul Warren on 11/24/09.
//  Copyright Primitive Dog Software 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPScrollingTextViewController;

@interface ScrollingCreditsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PRPScrollingTextViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PRPScrollingTextViewController *viewController;

@end

