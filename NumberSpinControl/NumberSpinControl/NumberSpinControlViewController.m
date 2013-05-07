/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  NumberSpinControlViewController.m
//  NumberSpinControl
//
//  Created by Paul Warren on 3/31/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import "NumberSpinControlViewController.h"

@implementation NumberSpinControlViewController

@synthesize numbers;
@synthesize numLabel;


- (void)dealloc
{
    [numLabel release];
    [super dealloc];
    self.numbers = nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];    
    [numbers addTarget:self action:@selector(numberChanged) 
                            forControlEvents:UIControlEventValueChanged];
    [numbers moveToNewNumber:2];
}

- (void)numberChanged
{
    numLabel.text = [NSString stringWithFormat:@"%d", numbers.currentNumber];
}

- (void)viewDidUnload
{
    [self setNumLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
