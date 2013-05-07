/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPURLEncodedPostViewController.m
//  BasicHTTPPost
//
//  Created by Matt Drance on 9/20/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPURLEncodedPostViewController.h"
#import "PRPFormEncodedPOSTRequest.h"

@implementation PRPURLEncodedPostViewController

@synthesize URLField;
@synthesize keyOne, valueOne;
@synthesize keyTwo, valueTwo;
@synthesize keyThree, valueThree;

- (IBAction)postURLEncodedForm:(id)sender {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.keyOne.text && self.valueOne.text) {
        [params setObject:self.valueOne.text forKey:self.keyOne.text];
    }
    if (self.keyTwo.text && self.valueTwo.text) {
        [params setObject:self.valueTwo.text forKey:self.keyTwo.text];
    }
    if (self.keyThree.text && self.valueThree.text) {
        [params setObject:self.valueThree.text forKey:self.keyThree.text];
    }
    
    NSString *URLString = ([self.URLField.text length] > 0) ? self.URLField.text : self.URLField.placeholder;
    
    NSURL *postURL = [NSURL URLWithString:URLString];
    NSURLRequest *postRequest;
    postRequest = [PRPFormEncodedPOSTRequest requestWithURL:postURL
                                             formParameters:params];

    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:postRequest
                                                 returningResponse:&response
                                                             error:&error];
    if (responseData) {
        NSLog(@"Response was %@", [NSString stringWithCString:[responseData bytes] encoding:NSUTF8StringEncoding]);        
    } else {
        NSLog(@"Error posting to %@ (%@)", URLString, error);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.keyOne = self.keyTwo = self.keyThree = nil;
    self.valueOne = self.valueTwo = self.valueThree = nil;
}


- (void)dealloc {
    [URLField release], URLField = nil;
    
    [keyOne release], keyOne = nil;
    [keyTwo release], keyTwo = nil;
    [keyThree release], keyThree = nil;
    
    [valueOne release], valueOne = nil;
    [valueTwo release], valueTwo = nil;
    [valueThree release], valueThree = nil;
    
    [super dealloc];
}

@end
