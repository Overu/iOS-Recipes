/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  SimpleDownloadViewController.h
//  SimpleDownload
//
//  Created by Matt Drance on 5/14/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPConnection.h"

@interface SimpleDownloadViewController : UIViewController {}

@property (nonatomic, retain) PRPConnection *download;

@property (nonatomic, retain) IBOutlet UILabel *progressLabel;
@property (nonatomic, retain) IBOutlet UIProgressView *progressView;
@property (nonatomic, retain) IBOutlet UILabel *thresholdLabel;
@property (nonatomic, retain) IBOutlet UISlider *thresholdSlider;
@property (nonatomic, retain) IBOutlet UIButton *downloadButton;

- (IBAction)downloadButtonTapped:(id)sender;
- (IBAction)thresholdChange:(id)sender;

@end