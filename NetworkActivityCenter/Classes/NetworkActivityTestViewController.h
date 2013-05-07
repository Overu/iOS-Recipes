/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  NetworkActivityTestViewController.h
//  NetworkActivityCenter
//
//  Created by Matt Drance on 3/1/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkActivityTestViewController : UITableViewController {}

@property (nonatomic, copy) NSArray *books;
@property (nonatomic, copy) NSArray *downloads;

- (IBAction)startDownloads:(id)sender;
- (IBAction)stopDownloads:(id)sender;

@end