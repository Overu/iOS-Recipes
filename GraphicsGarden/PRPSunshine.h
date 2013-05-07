/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPSunshine.h
//  RotationAnimation
//
//  Created by Paul Warren on 9/15/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PRPSmile.h"
#import "PRPetal.h"


@interface PRPSunshine : UIView {
        
}

@property (nonatomic, assign) CGFloat animationSpeed;
@property (nonatomic, retain) CALayer *shineLayer;

- (void)addRotationAnimation;

@end


