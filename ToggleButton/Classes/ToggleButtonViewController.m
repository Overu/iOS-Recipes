/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  ToggleButtonViewController.m
//  ToggleButton
//
//  Created by Matt Drance on 11/18/09.
//  Copyright Bookhouse Software, LLC 2009. All rights reserved.
//

#import "ToggleButtonViewController.h"
#import "PRPToggleButton.h"

const CGFloat kLabelX = 20.0;
const CGFloat kButtonX = 256.0;

@interface ToggleButtonViewController ()

@property (nonatomic, retain) UIImage *buttonOnImage;
@property (nonatomic, retain) UIImage *buttonOffImage;

@end

@implementation ToggleButtonViewController

@synthesize basicButton;
@synthesize toggleButton;

@synthesize buttonOnImage;
@synthesize buttonOffImage;

- (void)dealloc {
    [basicButton release], basicButton = nil;
    [toggleButton release], toggleButton = nil;
    
    [buttonOnImage release], buttonOnImage = nil;
    [buttonOffImage release], buttonOffImage = nil;
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.buttonOnImage = [UIImage imageNamed:@"off.png"];
    self.buttonOffImage = [UIImage imageNamed:@"on.png"];

    UIImage *highlightedImage =[UIImage imageNamed:@"highlighted.png"];
    
    // Self-managing PRPToggleButton
    CGRect codeLabelRect = CGRectMake(kLabelX, 114.0, 0.0, 0.0);
    UILabel* codeLabel = [[UILabel alloc] initWithFrame:codeLabelRect];
    codeLabel.text = @"PRPToggleButton from code";
    codeLabel.backgroundColor = self.view.backgroundColor;
    [codeLabel sizeToFit];
    [self.view addSubview:codeLabel];
    [codeLabel release];

    self.toggleButton = [PRPToggleButton buttonWithOnImage:self.buttonOnImage 
                                                  offImage:self.buttonOffImage
                                          highlightedImage:highlightedImage];
    CGFloat buttonWidth = self.buttonOnImage.size.width;
    CGFloat buttonHeight = self.buttonOffImage.size.height;
    self.toggleButton.frame = CGRectMake(kButtonX, 100.0, buttonWidth, buttonHeight);
    [self.view addSubview:toggleButton];
    [self.toggleButton addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // Manually managed UIButton (requires more setup and target code in View Controller)
    CGRect basicLabelRect = CGRectMake(kLabelX, 194.0, 0.0, 0.0);
    UILabel *basicLabel = [[UILabel alloc] initWithFrame:basicLabelRect];
    basicLabel.text = @"Plain UIButton";
    basicLabel.backgroundColor = self.view.backgroundColor;
    [basicLabel sizeToFit];
    [self.view addSubview:basicLabel];
    [basicLabel release];
    self.basicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.basicButton setBackgroundImage:self.buttonOffImage forState:UIControlStateNormal];
    [self.basicButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [self.basicButton addTarget:self action:@selector(plainButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.basicButton.frame = CGRectMake(kButtonX, 180.0, buttonWidth, buttonHeight);
    [self.view addSubview:self.basicButton];    
}

- (void)plainButtonTapped:(id)sender {
    if ([sender backgroundImageForState:UIControlStateNormal] == self.buttonOnImage) {
        [sender setBackgroundImage:self.buttonOffImage forState:UIControlStateNormal];
        NSLog(@"Plain UIButton was tapped; setting 'off' image");
    } else {
        [sender setBackgroundImage:self.buttonOnImage forState:UIControlStateNormal];
        NSLog(@"Plain UIButton was tapped; setting 'on' image");
    }
    [sender setNeedsDisplay];
}


- (IBAction)toggleButtonTapped:(id)sender {
    if ([sender isOn]) {
        NSLog(@"Toggle button was activated!");
    } else {
        NSLog(@"Toggle button was deactivated!");
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.basicButton = nil;
    self.toggleButton = nil;
}

@end