/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "PRPTrackingViewController.h"
#import "UITouch+PRPAdditions.h"

@implementation PRPTrackingViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        NSLog(@"Touch %p began at %@", touch,
              NSStringFromCGPoint([touch locationInView:touch.view]));
        [touch prp_saveOrigin];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        NSLog(@"Touch %p moved from %@ to %@", touch,
              NSStringFromCGPoint([touch prp_originInView:touch.view]),
              NSStringFromCGPoint([touch locationInView:touch.view]));
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        NSLog(@"Touch %p ended at %@; started at %@", touch,
              NSStringFromCGPoint([touch locationInView:touch.view]),
              NSStringFromCGPoint([touch prp_originInView:touch.view]));
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        NSLog(@"Touch %p cancelled at %@; started at %@", touch,
              NSStringFromCGPoint([touch locationInView:touch.view]),
              NSStringFromCGPoint([touch prp_originInView:touch.view]));
    }    
}

@end