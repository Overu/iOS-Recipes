/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  AppDelegate_Shared.m
//  BasicDataModel
//
//  Created by Matt Drance on 6/27/10.
//  Copyright Bookhouse Software, LLC 2010. All rights reserved.
//

#import "AppDelegate_Shared.h"
#import "PRPBasicDataModel.h"

@implementation AppDelegate_Shared

@synthesize dataModel;
@synthesize window;

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
