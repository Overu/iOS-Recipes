/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PerspectiveLayer.m
//  PerspectiveLayer
//
//  Created by Paul Warren on 8/28/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "PRPerspectiveLayer.h"


@implementation PRPerspectiveLayer


- (void)setZPosition:(CGFloat)pos {
   
    [super setZPosition: pos];
    CGFloat scale = 1 + pos/200;
    
    self.transform = CATransform3DMakeScale(scale, scale, 1);
}


@end
