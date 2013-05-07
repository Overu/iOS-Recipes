/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PerspectiveLayerAppDelegate.h
//  PerspectiveLayer
//
//  Created by Paul Warren on 8/28/10.
//  Copyright Primitive Dog Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PerspectiveLayerViewController;

@interface PerspectiveLayerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PerspectiveLayerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PerspectiveLayerViewController *viewController;

@end

