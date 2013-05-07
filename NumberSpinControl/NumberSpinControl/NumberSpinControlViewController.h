/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  NumberSpinControlViewController.h
//  NumberSpinControl
//
//  Created by Paul Warren on 3/31/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpinNumbers.h"

@interface NumberSpinControlViewController : UIViewController {}

@property (nonatomic, retain) IBOutlet SpinNumbers *numbers;
@property (nonatomic, retain) IBOutlet UILabel *numLabel;

@end
