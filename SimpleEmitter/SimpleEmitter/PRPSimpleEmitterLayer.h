/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPSimpleEmitterLayer.h
//  EmitterTest
//
//  Created by Paul Warren on 10/13/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface PRPSimpleEmitterLayer : CAReplicatorLayer    {}

@property (nonatomic, retain)  CALayer *imageLayer;
@property (nonatomic, assign)  CGFloat rotator;
@property (nonatomic, assign)  CGFloat length;
@property (nonatomic, assign)  CGFloat count;
@property (nonatomic, assign)  CGFloat angle;
@property (nonatomic, assign)  CGFloat cycleTime;
@property (nonatomic, assign)  CGFloat xAdjust;
@property (nonatomic, assign)  CGFloat yAdjust;


- (void)start;
- (void)stop;

@end
