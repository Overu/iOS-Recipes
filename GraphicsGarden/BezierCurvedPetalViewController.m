/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  BezierCurvedPetalViewController.m
//  BezierCurvedPetal
//
//  Created by Paul Warren on 9/4/10.
//  Copyright Primitive Dog Software 2010. All rights reserved.
//

#import "BezierCurvedPetalViewController.h"

@implementation BezierCurvedPetalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    PRPetal *petal = [[PRPetal alloc] initWithFrame:
                      CGRectMake(40, 60, 120, 160)];
    petal.innerColor = [UIColor colorWithRed:1 green:.5 blue:1 alpha:1];
    petal.outerColor = [UIColor colorWithRed:.8 green:.3 blue:.8 alpha:1];
    petal.lineThickness = 4;
    [self.view addSubview:petal];
    [petal release];
            
    PRPetal *leaf = [[PRPetal alloc] initWithFrame:
                     CGRectMake(200, 50, 100, 350)];
    leaf.innerColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    leaf.outerColor = [UIColor colorWithRed:0 green:.7 blue:0 alpha:1];
    leaf.strokeColor = [UIColor colorWithRed:0 green:.4 blue:0 alpha:1];
    [self.view addSubview:leaf];
    [leaf release];
    
    PRPSmile *smile = [[PRPSmile alloc] initWithFrame:
                       CGRectMake(50, 260, 140, 140)];
    smile.innerColor = [UIColor colorWithRed:1 green:.9 blue:0 alpha:1];
    smile.outerColor = [UIColor colorWithRed:1 green:.6 blue:0 alpha:1];
    [self.view addSubview:smile];
    [smile release];
    
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
