/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  ScrollingCreditsViewController.m
//  ScrollingCredits
//
//  Created by Paul Warren on 11/24/09.
//  Copyright Primitive Dog Software 2009. All rights reserved.
//

#import "PRPScrollingTextViewController.h"

@interface PRPScrollingTextViewController ()

@property (retain, nonatomic) AVAudioPlayer *audioPlayer;
@property (retain, nonatomic) UITextView *textView;

@end

@implementation PRPScrollingTextViewController

@synthesize scrollText;
@synthesize textView;
@synthesize audioPlayer;

- (NSString *)scrollText {
	
	if (scrollText == nil) {
		scrollText = @"Scrolling\nText Can Go\n\nHere";
	}	
	return scrollText;	
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	CATransform3D trans = CATransform3DIdentity;
	trans.m24 = -0.005;
	
	CGFloat size = self.view.frame.size.height;
	if (size > self.view.frame.size.width) size = self.view.frame.size.width;
	CGRect frame = CGRectMake(self.view.frame.size.width/2 - size/4, 
								size/4, 
								size/2, 
								size/4*3);
	textView = [[UITextView alloc] initWithFrame:frame];
	self.textView.editable = NO;
	self.textView.scrollEnabled = NO;
	self.textView.font = [UIFont boldSystemFontOfSize:20];
	self.textView.textAlignment = UITextAlignmentCenter;
	self.textView.backgroundColor = [UIColor blackColor];
	self.textView.textColor = [UIColor yellowColor];
	self.textView.text = self.scrollText;
	[self.view addSubview:self.textView];
    
	self.textView.layer.transform = trans;
	[self.textView setContentOffset:CGPointMake(0, -240) animated:NO];
}

-(void)viewDidAppear:(BOOL)animated {
	
    [UIView animateWithDuration:35 delay:0 
                        options:UIViewAnimationOptionCurveLinear 
                     animations:^{[self.textView 
                                   setContentOffset:CGPointMake(0, 500) 
                                   animated:NO];}
                     completion:NULL];
	
	NSURL *url = [NSURL fileURLWithPath:
				   [NSString stringWithFormat:@"%@/HeliumWars.m4a", 
				   [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] 
                        initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	[audioPlayer play];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
}

- (void)dealloc {
    [super dealloc];
	[textView release]; textView = nil;
	[scrollText release]; scrollText = nil;
	[audioPlayer release]; audioPlayer = nil;
}

@end
