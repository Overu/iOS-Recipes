/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  NSUserDefaults+PRPAdditions.m
//  SmartUserDefaults
//
//  Created by Matt Drance on 8/27/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "NSUserDefaults+PRPAdditions.h"


NSString *const PRPDefaultsKeyUsername  = @"prp_username";
NSString *const PRPDefaultsKeyCaching   = @"prp_cachingEnabled";
NSString *const PRPDefaultsKeyAutoLogin = @"prp_autoLoginEnabled";

@implementation NSUserDefaults (PRPAdditions)

#pragma mark -
#pragma mark Username

- (NSString *)prp_username {
    return [self stringForKey:PRPDefaultsKeyUsername];
}

- (void)prp_setUsername:(NSString *)username {
    [self setObject:username forKey:PRPDefaultsKeyUsername];
}

#pragma mark -
#pragma mark Auto Login
// Defaults to NO

- (BOOL)prp_isAutoLoginEnabled {
    return [self boolForKey:PRPDefaultsKeyAutoLogin];
}

- (void)prp_setAutoLoginEnabled:(BOOL)enabled {
    [self setBool:enabled forKey:PRPDefaultsKeyAutoLogin];
}

#pragma mark -
#pragma mark Caching
// Defaults to YES via DefaultPrefs.plist and -registerDefaults

- (BOOL)prp_isCachingEnabled {
    return [self boolForKey:PRPDefaultsKeyCaching];
}

- (void)prp_setCachingEnabled:(BOOL)enabled {
    [self setBool:enabled forKey:PRPDefaultsKeyCaching];
}

@end
