/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "UITouch+PRPAdditions.h"
#import <objc/runtime.h>

@implementation UITouch (PRPAdditions)

static char nameKey;

- (void)prp_saveOrigin {
    CGPoint windowPoint = [self locationInView:nil];
    CGPoint screenPoint = [self.window convertPoint:windowPoint toWindow:nil];
    objc_setAssociatedObject(self, 
                             &nameKey,
                             [NSValue valueWithCGPoint:screenPoint],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)prp_originInView:(UIView *)view {
    NSAssert((view.window != nil),
             @"-prp_originInView: 'view' parameter is not in a window");
			 
    NSValue *valueObject = objc_getAssociatedObject(self, &nameKey);
    CGPoint screenPoint = [valueObject CGPointValue];
    screenPoint = [view.window convertPoint:screenPoint fromWindow:nil];

    return [view convertPoint:screenPoint fromView:nil];
}

@end