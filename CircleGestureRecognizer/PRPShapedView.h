/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPShapedView.h
//  BezierCurvedPetal
//
//  Created by Paul Warren on 9/5/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PRPShapedView : UIView {
    
}

@property (nonatomic, assign) CGFloat lineThickness;
@property (nonatomic, retain) UIColor *innerColor;
@property (nonatomic, retain) UIColor *outerColor;
@property (nonatomic, retain) UIColor *strokeColor;

-(CGGradientRef) gradientWithColor:(UIColor *)color 
                           toColor:(UIColor *)color2  
                             count:(CGFloat)colorNum;


@end


