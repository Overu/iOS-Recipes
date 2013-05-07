/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  MainViewController.m
//  OpeningTransition
//
//  Created by Paul Warren on 9/18/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "MainViewController.h"
#define DURATION 20

@implementation MainViewController

- (void)addSmileForRadius:(CGFloat)radius withCenter:(CGPoint)center {
    
    CGRect smileRect = CGRectMake(center.x-radius, center.y-radius, radius*2, radius*2);
    PRPSmile *smile = [[PRPSmile alloc] initWithFrame:smileRect];
    smile.innerColor = [UIColor yellowColor];
    smile.outerColor = [UIColor colorWithRed:1 green:.8 blue:.2 alpha:1];
    [self.view addSubview:smile];
    [smile release];    
}

- (void)circleFound:(PRPCircleGestureRecognizer *)circleGesture {
    
    [self addSmileForRadius:circleGesture.radius withCenter:circleGesture.center];
}

- (void)tapped:(UITapGestureRecognizer *)gesture {

    int count = [self.view.subviews count];
    for (int i = 0; i < count; i++) {
        [[self.view.subviews lastObject] removeFromSuperview];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:.2 green:0.4 blue:1 alpha:1]; 
    
    CGRect labelFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/10);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.textAlignment =  UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Draw a full circle with your finger";
    [self.view addSubview:label];
    [label release];
    
    PRPCircleGestureRecognizer *circle = [[PRPCircleGestureRecognizer alloc] 
                                          initWithTarget:self 
                                          action:@selector(circleFound:)];
    circle.deviation = 0.5;
    [self.view addGestureRecognizer:circle];
    [circle release];
        
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] 
                                    initWithTarget:self
                                    action:@selector(tapped:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    [doubleTap release];
}

@end

