/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  ScrollViewPinsViewController.h
//  ScrollViewPins
//
//  Created by Matt Drance on 7/15/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPGridView;

@interface ScrollViewPinsViewController : UIViewController <UIScrollViewDelegate> {}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollingView;
@property (nonatomic, retain) IBOutlet PRPGridView *gridView;

- (UIView *)pinView;

@end