/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPURLEncodedPostViewController.h
//  BasicHTTPPost
//
//  Created by Matt Drance on 9/20/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PRPURLEncodedPostViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UITextField *URLField;

@property (nonatomic, retain) IBOutlet UITextField *keyOne;
@property (nonatomic, retain) IBOutlet UITextField *keyTwo;
@property (nonatomic, retain) IBOutlet UITextField *keyThree;

@property (nonatomic, retain) IBOutlet UITextField *valueOne;
@property (nonatomic, retain) IBOutlet UITextField *valueTwo;
@property (nonatomic, retain) IBOutlet UITextField *valueThree;

- (IBAction)postURLEncodedForm:(id)sender;

@end
