/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  RoundedViewViewController.m
//  RoundedView
//
//  Created by Paul Warren on 2/16/10.
//  Copyright Primitive Dog Software 2010. All rights reserved.
//

#import "RoundedViewViewController.h"

@implementation RoundedViewViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Defining the Textured colors from UIImages
    
    thickColor =   [UIColor colorWithPatternImage:
                    [UIImage imageNamed:@"thickColorGradient.png"]];
    UIColor *grayGradient = [UIColor colorWithPatternImage:
                              [UIImage imageNamed:@"grayGradient.png"]];
    UIColor *steelColor =   [UIColor colorWithPatternImage:
                              [UIImage imageNamed:@"simpleSteel.png"]];
    UIColor *steelTexture = [UIColor colorWithPatternImage:
                              [UIImage imageNamed:@"steelTexture.png"]];
    UIColor *woodTexture =  [UIColor colorWithPatternImage:
                              [UIImage imageNamed:@"woodTexture.png"]];

    CGRect buttonFrame = CGRectMake(60, 60, 200,80);
    UIButton *roundButton = [[UIButton alloc] initWithFrame:buttonFrame];
    roundButton.layer.borderWidth = 8;
    roundButton.layer.borderColor = thickColor.CGColor;
    roundButton.layer.backgroundColor = grayGradient.CGColor;
    roundButton.layer.cornerRadius = roundButton.bounds.size.height/4;
    [self.view addSubview:roundButton];
    
    [roundButton addTarget:self action:@selector(buttonPressed:) 
          forControlEvents:UIControlEventTouchDown];
    [roundButton addTarget:self action:@selector(buttonReleased:) 
          forControlEvents:UIControlEventTouchUpInside | 
     UIControlEventTouchUpOutside];
    
    UILabel *labelA = [self centeredLabel:buttonFrame label:@"Colorful"];
    labelA.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:36];
    labelA.textColor = thickColor;
    [roundButton addSubview:labelA];
    
    CGRect viewFrame = CGRectMake(30, 210, 260, 50);
    UIView *steelView = [[UIView alloc] initWithFrame:viewFrame];
    steelView.layer.borderWidth = 5;
    steelView.layer.borderColor = steelColor.CGColor;
    steelView.layer.backgroundColor = steelTexture.CGColor;
    steelView.layer.cornerRadius = steelView.bounds.size.height/4;
    [self.view addSubview:steelView];
    
    UILabel *labelB = [self centeredLabel:viewFrame label:@"Brushed Steel"];
    labelB.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:28];
    labelB.textColor = steelColor;
    [steelView addSubview:labelB];
    
    
    CGRect labelFrame = CGRectMake(10, 340, 300, 40);    
    UILabel *label = [self centeredLabel:labelFrame 
                                   label:@"A Much Longer Label"];
    label.frame = labelFrame;
    label.font = [UIFont fontWithName:@"Thonburi-Bold" size:24];
    label.textColor = steelColor;
    label.shadowColor = [UIColor blackColor];
    label.layer.borderWidth = 4;
    label.layer.borderColor = steelColor.CGColor;
    label.layer.backgroundColor = woodTexture.CGColor;
    label.layer.cornerRadius = label.frame.size.height/2;
    [self.view addSubview:label];
    
}

// This method sets all the common centered UILabel propertes
-(UILabel *)centeredLabel:(CGRect)rect label:(NSString *)text {
    
    CGRect labelRect = CGRectZero;
    labelRect.size = rect.size;
    UILabel *tmpLabel = [[UILabel alloc] initWithFrame:labelRect];
    tmpLabel.text = text;
    tmpLabel.backgroundColor = [UIColor clearColor];
    tmpLabel.textAlignment = UITextAlignmentCenter;
    tmpLabel.shadowColor = [UIColor blackColor];
    tmpLabel.shadowOffset = CGSizeMake(2, 2);
    return tmpLabel;
}

-(void)buttonPressed:(id)sender {
    
    [sender layer].borderColor = [UIColor cyanColor].CGColor;
    [sender layer].cornerRadius = 40;
}

-(void)buttonReleased:(id)sender {
    
    [sender layer].borderColor = thickColor.CGColor;
    [sender layer].cornerRadius = 20;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
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
