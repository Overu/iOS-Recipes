/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPSunshine.m
//  RotationAnimation
//
//  Created by Paul Warren on 9/15/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPSunshine.h"


@implementation PRPSunshine

@synthesize animationSpeed;

@synthesize shineLayer;


- (void) createSunshine {
    
    
    CGFloat halfHeight = self.bounds.size.height/2;
    CGFloat halfWidth = self.bounds.size.width/2;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat fullwidth = self.bounds.size.width;
    CGRect sunRect = CGRectMake(fullwidth/4, fullHeight/4, halfWidth, halfHeight);
    CGRect petalRect = CGRectMake(halfWidth-fullwidth/40, halfHeight-fullHeight/8, fullwidth/20, fullHeight/4);
    

    UIView *shineView = [[UIView alloc] initWithFrame:self.bounds];
    self.shineLayer = shineView.layer;
    [self addSubview:shineView];
    [shineView release];
    
    for (CGFloat i = M_PI/10; i < M_PI*2; i += M_PI/7.5) {
        PRPetal *petal = [[PRPetal alloc] initWithFrame:petalRect];
        petal.outerColor = [UIColor yellowColor];
        petal.innerColor = [UIColor colorWithRed:1 green:.8 blue:.2 alpha:1];
        petal.lineThickness = 40;
        petal.strokeColor = [UIColor whiteColor];
        
        [shineView addSubview:petal];
        [petal release];
        petal.layer.anchorPoint = CGPointMake(.5, 2);
        petal.transform = CGAffineTransformMakeRotation(i);
    }
    [self addRotationAnimation];
    
    PRPSmile *sunCenter = [[PRPSmile alloc] initWithFrame:sunRect];
    sunCenter.innerColor = [UIColor yellowColor];
    sunCenter.outerColor = [UIColor colorWithRed:1 green:.8 blue:.2 alpha:1];
    [self addSubview:sunCenter];
    [sunCenter release];
        
    
    
}

- (void)addRotationAnimation {
        

    CABasicAnimation *animation=[CABasicAnimation 
                                 animationWithKeyPath:@"transform.rotation"];
    animation.duration=10;
    animation.speed = self.animationSpeed;
    animation.repeatCount = MAXFLOAT;
    animation.fromValue=[NSNumber numberWithFloat:0];
    animation.toValue= [NSNumber numberWithFloat:M_PI*2];	
    [self.shineLayer addAnimation:animation forKey:@"rotate"];	

    animation.keyPath = @"opacity";
    animation.duration=.5;
    animation.autoreverses = YES;
    animation.fromValue=[NSNumber numberWithFloat:0.7];
    animation.toValue= [NSNumber numberWithFloat:1.0];	
    [self.shineLayer addAnimation:animation forKey:@"fade"];	

    animation.keyPath = @"transform.scale";
    animation.fromValue=[NSNumber numberWithFloat:.9];
    animation.toValue= [NSNumber numberWithFloat:1.1];	
    [self.shineLayer addAnimation:animation forKey:@"scale"];

}


- (void)setAnimationSpeed:(CGFloat)speed {
    
    animationSpeed = speed;
    [self.shineLayer removeAllAnimations];
    [self addRotationAnimation];
    
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        animationSpeed = 1;  // Do NOT call accessor here
        [self createSunshine];
    }
    return self;
}
- (void)dealloc {
	[shineLayer release], shineLayer = nil;


    [super dealloc];
}


@end


