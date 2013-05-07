/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPCloud.m
//  ShadowsPaths
//
//  Created by Paul Warren on 9/21/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPCloud.h"


@implementation PRPCloud


- (void)dealloc
{

	[super dealloc];
}
@synthesize shadowDistance;



- (void)drawRect:(CGRect)rect {   
    CGFloat fullHeight = self.bounds.size.height;  
    CGPoint top = CGPointMake(0, 0);
    CGPoint bottom = CGPointMake(0, fullHeight);
    UIBezierPath *pPath = [self CreatePathWithHeight:
                                                self.bounds.size.height];
    [pPath addClip];   
    CGGradientRef gradient = [self gradientWithColor:self.innerColor 
                                                   toColor:self.outerColor 
                                                     count:2];
    CGContextRef context = UIGraphicsGetCurrentContext();    
    CGContextDrawLinearGradient(context, 
                                gradient,
                                top, 
                                bottom,
                                0); 
    pPath.lineWidth = self.lineThickness;
    [self.strokeColor setStroke];
    [pPath stroke];  
    pPath = [self CreatePathWithHeight:self.bounds.size.height/2.0];
    self.layer.shadowPath = pPath.CGPath;
    if (!self.shadowDistance) shadowDistance = self.bounds.size.height*1.8;
    self.alpha = 0.9;
    self.layer.shadowOffset = CGSizeMake(0, self.shadowDistance);
    self.layer.shadowOpacity = 0.4;
}

- (UIBezierPath *) CreatePathWithHeight:(CGFloat)h {
    CGFloat w = self.bounds.size.width;
    CGFloat points[] = 
    {
		0.4, 0.2, 
        0.5, 0.1, 0.6, 0.2,
        0.8, 0.2, 0.8, 0.4,
        0.9, 0.5, 0.8, 0.6,
        0.8, 0.8, 0.6, 0.8,
        0.5, 0.9, 0.4, 0.8,
        0.2, 0.8, 0.2, 0.6,
        0.1, 0.5, 0.2, 0.4,
        0.2, 0.2, 0.4, 0.2,        
    };
    
    CGPoint point;
    CGPoint cPoint;
    UIBezierPath *pPath = [UIBezierPath bezierPath];
    
    point = CGPointMake(points[0]*w, points[1]*h);
    [pPath moveToPoint:point];   
    
    for (int i = 2; i <  sizeof(points)/sizeof(float); i+=4) {
        cPoint = CGPointMake(points[i]*w, points[i+1]*h);
        point = CGPointMake(points[i+2]*w, points[i+3]*h);

        [pPath addQuadCurveToPoint:point controlPoint:cPoint];  
    }
    [pPath closePath];
    
    return pPath;    
}



@end

