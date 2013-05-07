/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  SmartWebViewTestViewController.m
//  SmartWebView
//
//  Created by Matt Drance on 6/30/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "SmartWebViewTestViewController.h"
#import "PRPWebViewController.h"

@implementation SmartWebViewTestViewController

- (IBAction)modalButtonTapped:(id)sender {
    PRPWebViewController *webVC = [[PRPWebViewController alloc] init];
    webVC.url = [NSURL URLWithString:@"http://www.pragprog.com/titles/cdirec/ios-recipes"];
    webVC.showsDoneButton = YES;
    webVC.delegate = self;
    webVC.backgroundColor = [UIColor colorWithRed:0.151 green:0.151 blue:0.151 alpha:1.000];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:webVC];
    [self presentModalViewController:navc animated:YES];
    
    [webVC release];
    [navc release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

#pragma mark - PRPWebViewControllerDelegate
- (void)webControllerDidFinishLoading:(PRPWebViewController *)controller {
    NSLog(@"webControllerDidFinishLoading!");
}

- (void)webController:(PRPWebViewController *)controller didFailLoadWithError:(NSError *)error {
    [[[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] autorelease] show];
}

- (BOOL)webController:(PRPWebViewController *)controller shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return [self shouldAutorotateToInterfaceOrientation:orientation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Web View Test";
}

@end
