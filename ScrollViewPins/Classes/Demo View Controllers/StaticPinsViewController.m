/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  StaticPinsViewController.m
//  ScrollViewPins
//
//  Created by Matt Drance on 2/24/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "StaticPinsViewController.h"

#import "PRPGridView.h"

@implementation StaticPinsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.gridView addNonScalingSubview:[self pinView]];
}

@end
