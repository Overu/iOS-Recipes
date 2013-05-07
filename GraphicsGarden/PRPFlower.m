/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPFlower.m
//  CompositedTransformations
//
//  Created by Paul Warren on 9/6/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPFlower.h"
#import "PRPSmile.h"
#import "PRPetal.h"
#import "PRPStem.h"
#import <QuartzCore/QuartzCore.h>


@implementation PRPFlower

- (void) createNewFlower {
    
    CGFloat halfHeight = self.bounds.size.height/2;
    CGFloat halfWidth = self.bounds.size.width/2;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat fullwidth = self.bounds.size.width;
    CGRect smileRect = CGRectMake(halfWidth/2, halfHeight/4*.9, 
                                  halfWidth, halfHeight);
    CGRect petalRect = CGRectMake(halfWidth-fullwidth/10, fullHeight/5, 
                                  fullwidth/5, fullwidth/2);
    CGRect leafRect = CGRectMake(halfWidth-fullwidth/12, fullHeight*.84, 
                                 fullwidth/5, fullwidth/2);
    CGRect stemRect = CGRectMake(halfWidth-fullwidth/8, halfHeight*1.3, 
                                 fullwidth/4, halfHeight*.8);
    
    PRPStem *stem = [[PRPStem alloc] initWithFrame:stemRect];
    stem.outerColor = [UIColor colorWithRed:0 green:.5 blue:0 alpha:1];
    stem.innerColor = [UIColor colorWithRed:0.3 green:1 blue:.2 alpha:1];
    [self addSubview:stem];
    [stem release];
    
    for (CGFloat i = M_PI/10; i < M_PI*2; i += M_PI/7.5) {
        PRPetal *petal = [[PRPetal alloc] initWithFrame:petalRect];
        petal.outerColor = [UIColor purpleColor];
        petal.innerColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
        [self addSubview:petal];
        [petal release];
        petal.layer.anchorPoint = CGPointMake(.5, 1);
        petal.transform = CGAffineTransformMakeRotation(i);
    }
    
    for (CGFloat i = -M_PI/5; i < M_PI/5; i += M_PI/5*2) {
        PRPetal *leaf = [[PRPetal alloc] initWithFrame:leafRect];
        leaf.outerColor = [UIColor colorWithRed:0 green:.5 blue:0 alpha:1];
        leaf.innerColor = [UIColor colorWithRed:0.3 green:1 blue:.2 alpha:1];
        [self addSubview:leaf];
        [leaf release];
        leaf.layer.anchorPoint = CGPointMake(.5, 1);
        leaf.transform = CGAffineTransformMakeRotation(i);
    }
    
    PRPSmile *smile = [[PRPSmile alloc] initWithFrame:smileRect];
    smile.innerColor = [UIColor yellowColor];
    smile.outerColor = [UIColor colorWithRed:1 green:.4 blue:0 alpha:1];
    [self addSubview:smile];
    [smile release];
    
    
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self createNewFlower];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
