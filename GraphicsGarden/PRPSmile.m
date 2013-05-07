/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPSmile.m
//  BezierCurvedPetal
//
//  Created by Paul Warren on 9/5/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPSmile.h"


@implementation PRPSmile


- (void)drawRect:(CGRect)rect {
    
    CGFloat halfHeight = self.bounds.size.height/2;
    CGFloat halfWidth = self.bounds.size.width/2;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat fullwidth = self.bounds.size.width;
    CGFloat radius = (halfWidth > halfHeight) ? halfHeight : halfWidth;
    CGPoint midPoint = CGPointMake(halfWidth, halfHeight);
    
    UIBezierPath *pPath = [UIBezierPath 
                bezierPathWithArcCenter: midPoint 
                                 radius: radius 
                             startAngle: 0 
                               endAngle: M_PI*2 
                              clockwise: YES];    
    [pPath addClip];
        
    CGGradientRef gradient = [self gradientWithColor:self.innerColor 
                                             toColor:self.outerColor
                                               count:2];
	
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawRadialGradient(context, gradient, 
                                midPoint, 0, 
                                midPoint, radius, 0);
    
    pPath.lineWidth = self.lineThickness*1.7;
    [self.strokeColor setStroke];
    [pPath stroke];

    // Eyes and Smile    
    
    [pPath removeAllPoints];
    pPath.lineWidth = self.lineThickness;
    [pPath moveToPoint:CGPointMake(halfWidth/2, halfHeight*1.3)];
    [pPath addQuadCurveToPoint:CGPointMake(halfWidth*1.5, halfHeight*1.3) 
                  controlPoint:CGPointMake(halfWidth, fullHeight*.91)];
    [pPath stroke];
    
    pPath = [UIBezierPath 
             bezierPathWithOvalInRect:CGRectMake(fullwidth/3-halfWidth*.1, 
                                                              fullHeight/3, 
                                                              halfWidth*.2, 
                                                              halfHeight*.3)];
    pPath.lineWidth = self.lineThickness;
    [pPath fill];
    [pPath stroke];
   
    pPath = [UIBezierPath 
             bezierPathWithOvalInRect:CGRectMake(fullwidth/3*2-halfWidth*.1, 
                                                              fullHeight/3, 
                                                              halfWidth*.2, 
                                                              halfHeight*.3)];
    pPath.lineWidth = self.lineThickness;
    [pPath fill];
    [pPath stroke];
}

@end
