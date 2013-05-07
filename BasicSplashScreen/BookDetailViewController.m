/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPBookDetailViewController.m
//  BasicSplashScreen
//
//  Created by Matt Drance on 3/22/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "BookDetailViewController.h"

@implementation BookDetailViewController

@synthesize toolbar;
@synthesize popoverController;

- (void)dealloc {
    [toolbar release], toolbar = nil;
    [popoverController release], popoverController = nil;
    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.toolbar = nil;
    self.popoverController = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat kToolbarHeight = 44.0;
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0,0.0, self.view.bounds.size.width, kToolbarHeight)];
    [self.toolbar setAutoresizingMask:UIViewAutoresizingFlexibleWidth];        
    [self.view addSubview:self.toolbar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGRect frame = self.webView.frame;
    frame.origin.y = CGRectGetMaxY(self.toolbar.frame);
    frame.size.height = self.view.bounds.size.height - frame.origin.y;
    self.webView.frame = frame;    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.webView.request == nil) {
        self.url = [NSURL URLWithString:@"http://www.pragprog.com/titles/cdirec/ios-recipes"];
        [self reload];
    }
}

- (void)reload {
    [super reload];
    [self.popoverController dismissPopoverAnimated:YES];
}

- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {
    barButtonItem.title = @"Cocoa Titles";
    [self.toolbar setItems:[NSArray arrayWithObject:barButtonItem] 
                  animated:YES];
    self.popoverController = pc;
}

- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)button {
    self.toolbar.items = nil;
    self.popoverController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
