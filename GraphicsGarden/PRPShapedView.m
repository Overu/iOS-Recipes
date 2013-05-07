/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPShapedView.m
//  BezierCurvedPetal
//
//  Created by Paul Warren on 9/5/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPShapedView.h"

@implementation PRPShapedView

@synthesize lineThickness;
@synthesize innerColor;
@synthesize outerColor;
@synthesize strokeColor;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor clearColor];
        self.innerColor = [UIColor yellowColor];
        self.outerColor = [UIColor redColor];
        self.strokeColor = [UIColor blackColor];
        self.lineThickness = 3;        
    }
    return self;
}

- (void)dealloc {
    [innerColor release], innerColor = nil;
    [strokeColor release], strokeColor = nil;
    [outerColor release], outerColor = nil;

    [super dealloc];
}

- (void)setLineThickness:(CGFloat)value {
    
    CGFloat halfHeight = self.bounds.size.height/2;
    CGFloat halfWidth = self.bounds.size.width/2;
    CGFloat smallest = (halfWidth > halfHeight) ? halfHeight : halfWidth;
    CGFloat factor = smallest/100;
    factor = (factor > 1) ? 1 : factor;
    lineThickness = value*factor;
    
}


-(CGGradientRef) gradientWithColor:(UIColor *)color 
                            toColor:(UIColor *)color2  
                             count:(CGFloat)colorCount
{ 
    const CGFloat *colorParts = CGColorGetComponents(color.CGColor);
    CGFloat red = colorParts[0];
    CGFloat green = colorParts[1];
    CGFloat blue = colorParts[2];
    
    const CGFloat *color2Parts = CGColorGetComponents(color2.CGColor);
    CGFloat red2 = color2Parts[0];
    CGFloat green2 = color2Parts[1];
    CGFloat blue2 = color2Parts[2];
    CGFloat graduations[] =
    {
        red, green, blue, 1.0,
        red2, green2, blue2, 1.0,
        red, green, blue, 1.0
    };
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = 
            CGGradientCreateWithColorComponents(rgb, 
                                        graduations, 
                                        NULL, 
                                        colorCount);
    CGColorSpaceRelease(rgb);
    [(id)gradient autorelease];
    return gradient;
}




@end


