/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPGradientView.m
//  TwoToneTables
//
//  Created by Matt Drance on 8/4/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPGradientView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PRPGradientView

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (void)setGradientColors:(NSArray *)colors {
    SEL setColorsSel = @selector(setColors:);
    if ([self.layer respondsToSelector:setColorsSel]) {
        [self.layer performSelector:setColorsSel withObject:colors];
    }
}

@end