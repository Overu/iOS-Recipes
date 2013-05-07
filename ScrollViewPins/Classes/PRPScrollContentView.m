/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPScrollContentView.m
//  ScrollViewPins
//
//  Created by Matt Drance on 2/22/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "PRPScrollContentView.h"

@interface PRPScrollContentView ()

- (void)adjustSubviewsForTransform:(CGAffineTransform)transform;

@end

@implementation PRPScrollContentView

@synthesize nonScalingSubviews;

- (void)dealloc {
    [nonScalingSubviews release], nonScalingSubviews = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
- (NSMutableSet *)nonScalingSubviews {
    if (nonScalingSubviews == nil) {
        nonScalingSubviews = [[NSMutableSet alloc] init];
    }
    return nonScalingSubviews;
}

- (void)addNonScalingSubview:(UIView *)view {
    [self.nonScalingSubviews addObject:view];
    [self addSubview:view];
}

#pragma mark -
#pragma mark (Non-)Scaling support
- (void)setTransform:(CGAffineTransform)transform {
    [super setTransform:transform];
    [self adjustSubviewsForTransform:transform];
}

- (void)adjustSubviewsForTransform:(CGAffineTransform)transform {
    CGAffineTransform inversion = CGAffineTransformInvert(transform);
    for (UIView *subview in self.nonScalingSubviews) {
        subview.transform = inversion;
    }
}

@end
