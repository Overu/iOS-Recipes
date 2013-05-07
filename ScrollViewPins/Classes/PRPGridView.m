/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPGridView.m
//  ScrollViewPins
//
//  Created by Matt Drance on 7/15/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPGridView.h"

@implementation PRPGridView

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] set];
    UIRectFill(rect);
    
    [[UIColor whiteColor] set];
    UIBezierPath *path = [UIBezierPath bezierPath];

    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointZero;
    
    for (int row = 0; row < height; row += 10) {
        startPoint.x = 0;
        startPoint.y = endPoint.y = row;
        endPoint.x = width;
        [path moveToPoint:startPoint];
        [path addLineToPoint:endPoint];
        for (int col = 0; col < width; col += 10) {
            startPoint.x = endPoint.x = col;
            startPoint.y = 0;
            endPoint.y = height;
            [path moveToPoint:startPoint];
            [path addLineToPoint:endPoint];
        }
    }
    [path stroke];
}

- (void)dealloc {
    [super dealloc];
}

@end