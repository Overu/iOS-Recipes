/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  DemoViewController.m
//  SmartUserDefaults
//
//  Created by Matt Drance on 3/17/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "DemoViewController.h"
#import "NSUserDefaults+PRPAdditions.h"

@implementation DemoViewController

@synthesize usernameField;
@synthesize cacheSwitch;
@synthesize autoLoginSwitch;

- (id)init {
    return [super initWithNibName:@"DemoViewController" bundle:nil];
}

- (void)dealloc {
    [usernameField release], usernameField = nil;
    [cacheSwitch release], cacheSwitch = nil;
    [autoLoginSwitch release], autoLoginSwitch = nil;
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.usernameField.text = defaults.prp_username;
    self.cacheSwitch.on = defaults.prp_cachingEnabled;
    self.autoLoginSwitch.on = defaults.prp_autoLoginEnabled;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.usernameField = nil;
    self.cacheSwitch = nil;
    self.autoLoginSwitch = nil;
}

#pragma mark - User input
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [[NSUserDefaults standardUserDefaults] prp_setUsername:textField.text];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (IBAction)cacheSwitchToggled:(id)sender {
    [NSUserDefaults standardUserDefaults].prp_cachingEnabled = [sender isOn];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)loginSwitchToggled:(id)sender {
    [NSUserDefaults standardUserDefaults].prp_autoLoginEnabled = [sender isOn];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
