/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  AlertTestViewController.m
//  PRPAlertView
//
//  Created by Matt Drance on 1/24/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "AlertTestViewController.h"
#import "PRPAlertView.h"

@implementation AlertTestViewController

@synthesize OKCount;
@synthesize cancelCount;

@synthesize OKLabel;
@synthesize cancelLabel;

- (void)dealloc {
    [OKLabel release], OKLabel = nil;
    [cancelLabel release], cancelLabel = nil;

    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.OKLabel = self.cancelLabel = nil;
}

- (id)init {
    return [self initWithNibName:@"AlertTestViewController" bundle:nil];
}

- (void)refreshLabels {
    self.OKLabel.text = [NSString stringWithFormat:@"%d", self.OKCount];
    self.cancelLabel.text = [NSString stringWithFormat:@"%d", self.cancelCount];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshLabels];
}

- (IBAction)showAlertButtonTapped:(id)sender {
    [PRPAlertView showWithTitle:@"Test" message:@"Testing..." cancelTitle:@"Cancel" 
                    cancelBlock:^(void) {
                        self.cancelCount++;
                        [self refreshLabels];
                    }
                     otherTitle:@"OK"
                     otherBlock:^(void) {
                         self.OKCount++;
                         [self refreshLabels];
                     }];

}

@end
