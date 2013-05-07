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
//  SlideInView
//
//  Created by Paul Warren on 11/19/09.
//  Copyright Primitive Dog Software 2009. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController

@synthesize IBSlideIn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

//  Demonstration of SlideInViews created in code and via interface Builder
- (void) createSlideIns {
  
	SlideInView *leftSlideIn = [SlideInView viewWithImage:[UIImage imageNamed:@"iPhone.jpg"]];
	[leftSlideIn showWithTimer:1 inView:self.view from:SlideInViewLeft bounce:NO];

	SlideInView *rightSlideIn = [SlideInView viewWithImage:[UIImage imageNamed:@"anim.jpg"]];
	[rightSlideIn showWithTimer:1.5 inView:self.view from:SlideInViewRight bounce:NO];
	 
	SlideInView *topSlideIn = [SlideInView viewWithImage:[UIImage imageNamed:@"cocoa.jpg"]];
	[topSlideIn showWithTimer:1.25 inView:self.view from:SlideInViewTop bounce:YES];

	[IBSlideIn showWithTimer:1.75 inView:self.view from:SlideInViewBot bounce:YES];
	
	[self performSelector:@selector(createSlideIns) withObject:nil afterDelay:3];    //keep looping for demo
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 [super viewDidLoad];

	 [self createSlideIns];
 }



- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

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
	[IBSlideIn release];
    [super dealloc];
}


@end



