/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPetal.m
//  BezierCurvedPetal
//
//  Created by Paul Warren on 9/4/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPetal.h"


@implementation PRPetal



- (void)drawRect:(CGRect)rect {
    
    CGFloat halfHeight = self.bounds.size.height/2;
    CGFloat halfWidth = self.bounds.size.width/2;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat fullwidth = self.bounds.size.width;
    
    CGPoint startPoint = CGPointMake(halfWidth, 3);  
    CGPoint midPoint = CGPointMake(halfWidth, halfHeight*1.6);
    CGPoint endPoint = CGPointMake(halfWidth, fullHeight);
    CGPoint corner = CGPointMake(fullwidth, 0);
    CGPoint leftCtrl = CGPointMake(-halfWidth, halfHeight/3);
    CGPoint rightCtrl = CGPointMake(fullwidth*1.5, halfHeight/3);
    
    UIBezierPath *pPath = [UIBezierPath bezierPath];
    [pPath moveToPoint:startPoint];   

    [pPath addCurveToPoint:endPoint 
             controlPoint1:leftCtrl
             controlPoint2:midPoint];
    
    [pPath addCurveToPoint:startPoint 
             controlPoint1:midPoint
             controlPoint2:rightCtrl];
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


