/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  ScrollViewPinsViewController.m
//  ScrollViewPins
//
//  Created by Matt Drance on 7/15/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import "ScrollViewPinsViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "PRPGridView.h"

#define PRPPinRectForRect(rect) CGRectMake(CGRectGetMidX(rect), CGRectGetMidY(rect), 20.0, 20.0)

@implementation ScrollViewPinsViewController

@synthesize gridView;
@synthesize scrollingView;

- (void)dealloc {
    [scrollingView release], scrollingView = nil;
    [gridView release], gridView = nil;
    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.scrollingView = nil;
    self.gridView = nil;
}

- (UIView *)pinView {
    CGRect contentRect = ([self isViewLoaded] ? self.view.bounds : CGRectZero);
    UIView *pinOne = [[[UIView alloc] initWithFrame:PRPPinRectForRect(contentRect)] autorelease];
    pinOne.layer.cornerRadius = 10.0;
    pinOne.backgroundColor = [UIColor redColor];
    return pinOne;
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.gridView;
}

@end