/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  ToggleButtonViewController.h
//  ToggleButton
//
//  Created by Matt Drance on 11/18/09.
//  Copyright Bookhouse Software, LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPToggleButton;

@interface ToggleButtonViewController : UIViewController {}

@property (nonatomic, retain) UIButton *basicButton;
@property (nonatomic, retain) PRPToggleButton *toggleButton;

- (IBAction)toggleButtonTapped:(id)sender;

@end