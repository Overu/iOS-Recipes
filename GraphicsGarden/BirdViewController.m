/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
    //
//  BirdViewController.m
//  GraphicsGarden
//
//  Created by Paul Warren on 9/23/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "BirdViewController.h"
#define DURATION 10.0


@implementation BirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    CGRect rect = CGRectMake(-width/4, 0, width/2, height/2);
    PRPBird *bird = [[PRPBird alloc] initWithFrame:rect];
    [self.view addSubview:bird];
    [bird release];
//    bird.animationDuration = 1.0;
    [bird startAnimating];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position";
    CGPoint pos = CGPointMake(width, bird.center.y*2);
    anim.toValue = [NSValue valueWithCGPoint:pos];
    anim.duration = DURATION;
    anim.repeatCount = MAXFLOAT;
    [bird.layer addAnimation:anim forKey:@"pos"];
    
    anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.fromValue = [NSNumber numberWithFloat:0.25];
    anim.toValue = [NSNumber numberWithFloat:1.0];
    anim.duration = DURATION;
    anim.repeatCount = MAXFLOAT;
    [bird.layer addAnimation:anim forKey:@"scale"];
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
