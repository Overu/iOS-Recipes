/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  SimpleDownloadViewController.m
//  SimpleDownload
//
//  Created by Matt Drance on 5/14/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import "SimpleDownloadViewController.h"

@implementation SimpleDownloadViewController

@synthesize download;
@synthesize progressLabel;
@synthesize progressView;
@synthesize thresholdLabel;
@synthesize thresholdSlider;
@synthesize downloadButton;

- (void)dealloc {
    [progressLabel release], progressLabel = nil;
    [progressView release], progressView = nil;
    [thresholdLabel release], thresholdLabel = nil;
    [downloadButton release], downloadButton = nil;
    [thresholdSlider release], thresholdSlider = nil;

    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.progressLabel = nil;
    self.progressView = nil;    
    self.thresholdLabel = nil;
    self.thresholdSlider = nil;
    self.downloadButton = nil;    
}

- (void)updateThresholdLabel {
    self.thresholdLabel.text = [NSString stringWithFormat:@"%d%%", lround((double)[self.thresholdSlider value])];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateThresholdLabel];
}

#pragma mark -
#pragma mark Actions
- (IBAction)downloadButtonTapped:(id)sender {
    NSURL *downloadURL = [NSURL URLWithString:@"http://screencasts.pragprog.com/v-bdobjc-v-sampler.m4v"];
    PRPConnectionProgressBlock progress = ^(PRPConnection *connection) {
        self.progressView.progress = download.percentComplete / 100;
        self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%", download.percentComplete];
    };
    
    PRPConnectionCompletionBlock complete = ^(PRPConnection *connection, NSError *error) {
        if (error) {
            self.progressView.progress = download.percentComplete;
            self.progressLabel.text = @"Failed";
        } else {
            self.progressView.progress = 1.0;
            self.progressLabel.text = @"Finished";
        }
        self.download = nil;
        self.downloadButton.enabled = YES;
    };
    
    self.download = [PRPConnection connectionWithURL:downloadURL
                                       progressBlock:progress
                                     completionBlock:complete];
    self.download.progressThreshold = lround(self.thresholdSlider.value);
    [self.download start];     
                               
    self.progressView.progress = 0;
    self.progressLabel.text = @"0%";
    self.downloadButton.enabled = NO;
}

- (IBAction)thresholdChange:(id)sender {
    [self updateThresholdLabel];
}

@end