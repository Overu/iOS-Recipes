/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  GradientView.m
//  AnimatedGradientLayer
//
//  Created by Paul Warren on 9/16/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "GradientView.h"


@implementation GradientView

#define Duration 6;

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (void)didMoveToSuperview {    
    self.backgroundColor = [UIColor blackColor];
    CGColorRef color = [UIColor blackColor].CGColor;
    UIColor *color1 = [UIColor colorWithRed:0.01 green:0.20 blue:0.80 
                                                                alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:1.00 green:0.50 blue:0.00 
                                                                alpha:1.0];
    UIColor *color3 = [UIColor colorWithRed:0.35 green:0.74 blue:0.11 
                                                                alpha:1.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)[color1 CGColor],
                       [color2 CGColor],
                       [color3 CGColor],
                       nil];

    CAGradientLayer *gLayer = (CAGradientLayer *)self.layer;
    gLayer.colors = colors;
    gLayer.locations = [NSArray arrayWithObjects:
                        [NSNumber numberWithFloat:0.0], 
                        [NSNumber numberWithFloat:0.4], 
                        [NSNumber numberWithFloat:0.9], 
                        nil];
    gLayer.startPoint = CGPointMake(0.5, 0);
    gLayer.endPoint = CGPointMake(0.5, 1);

    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:
                                                            @"startPoint"];
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0.5, 1)];
    anim.duration = Duration
    anim.timingFunction = [CAMediaTimingFunction 
                           functionWithName:kCAMediaTimingFunctionEaseOut];
    [gLayer addAnimation:anim forKey:@"start"];
                        
   
    anim = [CABasicAnimation animationWithKeyPath:@"colors"];
    anim.fromValue = [NSArray arrayWithObjects:(id)color, color, color, nil];
    anim.duration = Duration;
    anim.timingFunction = [CAMediaTimingFunction 
                           functionWithName:kCAMediaTimingFunctionEaseOut];
    [gLayer addAnimation:anim forKey:@"colors"];
}

- (void)dealloc {
    [super dealloc];
}


@end
