/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  DemoViewController.h
//  SmartUserDefaults
//
//  Created by Matt Drance on 3/17/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DemoViewController : UIViewController <UITextFieldDelegate> {}

@property (nonatomic, retain) IBOutlet UITextField *usernameField;
@property (nonatomic, retain) IBOutlet UISwitch *cacheSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *autoLoginSwitch;

- (IBAction)cacheSwitchToggled:(id)sender;
- (IBAction)loginSwitchToggled:(id)sender;

@end
