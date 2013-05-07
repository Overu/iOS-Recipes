/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  FontsTableViewController.h
//  SplashScreenReveal
//
//  Created by Paul Warren on 1/24/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPAttributedLabel.h"

@interface FontsTableViewController : UITableViewController {}

@property (nonatomic, retain)  NSMutableArray *attributedFontNames;

@end
