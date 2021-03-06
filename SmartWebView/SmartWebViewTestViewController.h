/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  SmartWebViewTestViewController.h
//  SmartWebView
//
//  Created by Matt Drance on 6/30/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PRPWebViewControllerDelegate.h"

@interface SmartWebViewTestViewController : UIViewController <PRPWebViewControllerDelegate> {}

- (IBAction)modalButtonTapped:(id)sender;

@end