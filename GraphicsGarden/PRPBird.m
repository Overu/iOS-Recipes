/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPBird.m
//  ViewAnimation
//
//  Created by Paul Warren on 9/23/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPBird.h"

#define LOWWING 0.2
#define HIGHWING 0.5
#define STEPS 0.05
#define COUNT (HIGHWING-LOWWING)/STEPS*2

@interface PRPBird ()

- (NSArray *)arrayOfFrames;
- (UIImage *)animationFrame:(CGFloat)flap;

@end


@implementation PRPBird

- (void)didMoveToSuperview {
    
    if (!self.animationImages) {
        self.animationImages = [self arrayOfFrames];        
    }    
}

- (NSArray *)arrayOfFrames {
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:COUNT];
    
    for (CGFloat i = LOWWING; i < HIGHWING; i+=STEPS) {
        [imageArray addObject:[self animationFrame:i]];
    }
    for (CGFloat i = HIGHWING; i > LOWWING; i-=STEPS) {
        [imageArray addObject:[self animationFrame:i]];
    }
    
    return [NSArray arrayWithArray:imageArray];
}

- (UIImage *)animationFrame:(CGFloat)frameNum {

    CGFloat width = self.bounds.size.width;		
    CGFloat height = self.bounds.size.height;		

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), 
                                                                NO, 0);    
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointMake(0, frameNum)];
    [path addQuadCurveToPoint:CGPointMake(0.5, 0.6-frameNum/3) 
                 controlPoint:CGPointMake(0.25, 0.25)];
    [path addQuadCurveToPoint:CGPointMake(1, frameNum) 
                 controlPoint:CGPointMake(0.75, 0.25)];

    [path applyTransform:CGAffineTransformMakeScale(width, height)];

    path.lineWidth = height/30;
    [path stroke];

    UIImage *frameImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();  

    return frameImage;    
}


@end

