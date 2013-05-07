/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPStem.m
//  CompositedTransformations
//
//  Created by Paul Warren on 9/6/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPStem.h"

@implementation PRPStem


- (void)drawRect:(CGRect)rect {
    
    CGFloat halfHeight = self.bounds.size.height/2;
    CGFloat halfWidth = self.bounds.size.width/2;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat fullwidth = self.bounds.size.width;
    
    CGPoint startPoint1 = CGPointMake(halfWidth*.9, 0);  
    CGPoint midPoint = CGPointMake(halfWidth, halfHeight);
    CGPoint endPoint1 = CGPointMake(halfWidth*.9, fullHeight);
    CGPoint corner = CGPointMake(fullwidth, 0);
    CGPoint leftCtrl = CGPointMake(0, halfHeight);
    CGPoint rightCtrl = CGPointMake(fullwidth, halfHeight);
    
    UIBezierPath *pPath = [UIBezierPath bezierPath];
    [pPath moveToPoint:startPoint1];   
    
    [pPath addCurveToPoint:endPoint1 
             controlPoint1:leftCtrl
             controlPoint2:rightCtrl];
    
    [pPath addCurveToPoint:startPoint1 
             controlPoint1:rightCtrl
             controlPoint2:midPoint];
    [pPath closePath];
    [pPath addClip];
    
    CGGradientRef gradient = [self gradientWithColor:self.innerColor 
                                             toColor:self.outerColor 
                                               count:3];
    CGContextRef context = UIGraphicsGetCurrentContext();    
	CGContextDrawLinearGradient(context, 
                                gradient,
                                CGPointZero, 
                                corner,
                                0); 
    
    pPath.lineWidth = self.lineThickness;
    [self.strokeColor setStroke];
    [pPath stroke];
}

@end
