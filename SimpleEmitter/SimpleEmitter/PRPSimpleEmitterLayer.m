/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPSimpleEmitterLayer.m
//  EmitterTest
//
//  Created by Paul Warren on 10/13/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPSimpleEmitterLayer.h"

@implementation PRPSimpleEmitterLayer

@synthesize imageLayer,
            rotator, 
            length, 
            count, 
            angle, 
            cycleTime,
            xAdjust, 
            yAdjust;

- (id)init {
    self = [super init];
    if (self) {
        self.count = 1;
        self.instanceColor = [UIColor whiteColor].CGColor;       
        imageLayer = [CALayer layer];
        self.imageLayer.contents = 
                (id)[UIImage imageNamed:@"tspark.png"].CGImage;
        [self addSublayer:self.imageLayer];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
    [imageLayer release]; imageLayer = nil;
}


-(void)animate {
    
    CGPoint newPoint = CGPointMake(0, length);
    CABasicAnimation *basic = [CABasicAnimation animation];
    basic.keyPath = @"position";
    basic.toValue = [NSValue valueWithCGPoint:newPoint];
    basic.duration = self.cycleTime;
    basic.repeatCount = MAXFLOAT;
    [imageLayer addAnimation:basic forKey:@"position"];    
}

- (void)start {
    
    self.imageLayer.frame = self.bounds;
    self.imageLayer.opacity = 1.0;
    self.instanceCount = count;
    self.instanceDelay = cycleTime/count;
    CATransform3D t = CATransform3DMakeRotation(self.rotator, 0, 0, 1);
    self.instanceTransform = CATransform3DTranslate(t, 
                                            xAdjust, 
                                            yAdjust, 0);
    self.transform = CATransform3DMakeRotation(angle, 0, 0, 1);

    [self animate];
}

- (void)stop {
    
    self.imageLayer.opacity = 0;
    self.instanceCount = 0;    
    [self.imageLayer removeAllAnimations];
}


@end
