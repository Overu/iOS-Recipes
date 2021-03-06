/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  RootViewController.h
//  CellSubviewLocation
//
//  Created by Matt Drance on 9/9/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTableCell;

@interface RootViewController : UITableViewController {}

@property (nonatomic, retain) UINib *cellNib;
@property (nonatomic, assign) IBOutlet CustomTableCell *customCell;

- (IBAction)cellButtonTapped:(id)sender;

@end
