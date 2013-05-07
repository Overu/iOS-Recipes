/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  NSUserDefaults+PRPAdditions.h
//  SmartUserDefaults
//
//  Created by Matt Drance on 8/27/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (PRPAdditions) 

@property (assign, getter=prp_isAutoLoginEnabled,
           setter=prp_setAutoLoginEnabled:) BOOL prp_autoLoginEnabled;
@property (assign, getter=prp_isCachingEnabled,
           setter=prp_setCachingEnabled:) BOOL prp_cachingEnabled;
@property (assign, getter=prp_username, 
           setter=prp_setUsername:) NSString *prp_username;

@end
