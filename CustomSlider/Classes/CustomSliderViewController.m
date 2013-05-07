/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  CustomSliderViewController.m
//  CustomSlider
//
//  Created by Paul Warren on 6/23/10.
//  Copyright Primitive Dog Software 2010. All rights reserved.
//

#import "CustomSliderViewController.h"

@implementation CustomSliderViewController

@synthesize progress1;
@synthesize progress2;
@synthesize customSlider;
@synthesize customProgress;


// called at startup
- (void)viewDidLoad {
    [super viewDidLoad];


//  Set the Thumb Images for the cusomized sliders   
    
    UIImage* sunImage = [UIImage imageNamed:@"sun.png"];
    [customSlider setThumbImage:sunImage forState:UIControlStateNormal];

//  The slider point image is a rightside crop of the left Image and gives the effect
//  of a curved progress meter. With a transaparant image a straight joint is visible
//  and looks a unfinished.     

    customProgress.userInteractionEnabled = NO;

    UIImage* sliderPoint = [UIImage imageNamed:@"sliderPoint.png"];
    [customProgress setThumbImage:sliderPoint forState:UIControlStateNormal];

    UIImage *leftStretch = [[UIImage imageNamed:@"leftImage.png"]
                                    stretchableImageWithLeftCapWidth:10.0 
                                                        topCapHeight:0.0];
    [customProgress setMinimumTrackImage:leftStretch 
                                            forState:UIControlStateNormal];

    UIImage *rightStretch = [[UIImage imageNamed:@"rightImage.png"]
                                    stretchableImageWithLeftCapWidth:10.0 
                                                        topCapHeight:0.0];
    [customProgress setMaximumTrackImage:rightStretch 
                                            forState:UIControlStateNormal];

// Note the different value for the LeftCapWidth - 31 here.
// The image is 62 points wide so this sets the stretch point to the middle of the image
// allowing the slider shape to having embedded end images.
    
    UIImage *leftStretch2 = [[UIImage imageNamed:@"leftBulb.png"]
                            stretchableImageWithLeftCapWidth:31.0 topCapHeight:0.0];
    [customSlider setMinimumTrackImage:leftStretch2 forState:UIControlStateNormal];

    UIImage *rightStretch2 = [[UIImage imageNamed:@"rightBulb.png"]
                             stretchableImageWithLeftCapWidth:31.0 topCapHeight:0.0];
    [customSlider setMaximumTrackImage:rightStretch2 forState:UIControlStateNormal];
    
}

#pragma mark Slider syncing methods

- (void)updateProgressors {
    
    customProgress.value = progression;
    progress1.progress = progression;
    progress2.progress = progression;
}

- (IBAction)processSlider:(UISlider *)slider {
    
    progression = slider.value;
    [self updateProgressors];
}

#pragma mark Timer code

- (IBAction)processTimer:(UIButton *)sender {
    
    if (timer) {
        [timer invalidate];
        timer = nil;
        [sender setTitle:@"Start Progress Timer" forState:UIControlStateNormal];
        [sender setTitle:@"I'm gonna start" forState:UIControlStateHighlighted];
        
    } else {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self 
                                                selector:@selector(progress) 
                                                userInfo:nil 
                                                 repeats:YES];
        [sender setTitle:@"Stop Progress Timer" forState:UIControlStateNormal];
        [sender setTitle:@"I'm gonna stop" forState:UIControlStateHighlighted];
   }

}

- (void)progress {
    
    progression += 0.01;
    if (progression > 1.0) progression = 0.0;
    [self updateProgressors];
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
	[customSlider release], customSlider = nil;
	[customProgress release], customProgress = nil;
	[progress1 release], progress1 = nil;
	[progress2 release], progress2 = nil;

    [super dealloc];
}

@end


