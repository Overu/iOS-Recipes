/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PerspectiveLayerViewController.m
//  PerspectiveLayer
//
//  Created by Paul Warren on 8/28/10.
//  Copyright Primitive Dog Software 2010. All rights reserved.
//

#import "PerspectiveLayerViewController.h"

static double frandom(double start, double end)
{
    double r = random();
    r /= RAND_MAX;
    r = start + r*(end-start);    
    return r;
}

@implementation PerspectiveLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    basic.fromValue = [NSNumber numberWithFloat:480];
    basic.toValue = [NSNumber numberWithFloat:-240];
    basic.autoreverses = NO;
    basic.repeatCount = INT_MAX;
    
    for (int i = 0; i < 20; i++) {
        pLayer = [PRPerspectiveLayer layer];
        pLayer.frame = CGRectMake(frandom(-80, 240), 0, 160, 240);
        pLayer.backgroundColor = [UIColor colorWithRed:frandom(.8, .2) green:frandom(.8, .2) blue:frandom(.8, .2) alpha:1].CGColor;
        pLayer.zPosition = frandom(100, -300);
        basic.duration = frandom(2,5);
        [pLayer addAnimation:basic forKey:@"origin"];
        [self.view.layer addSublayer:pLayer];
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
        
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"sublayerTransform.rotation.y"];
    basic.toValue = [NSNumber numberWithFloat:M_PI*2];
    basic.duration = 5;
    basic.repeatCount = MAXFLOAT;
    [self.view.layer addAnimation:basic forKey:@"spin"];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
