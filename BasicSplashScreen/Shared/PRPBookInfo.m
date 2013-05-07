/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPBookInfo.m
//  BasicSplashScreen
//
//  Created by Matt Drance on 3/21/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "PRPBookInfo.h"

@implementation PRPBookInfo

@synthesize bookTitle;
@synthesize authors;
@synthesize URLString;

- (void)dealloc {
    [bookTitle release], bookTitle = nil;
    [authors release], authors = nil;
    [URLString release], URLString = nil;

    [super dealloc];
}

+ (id)infoWithTitle:(NSString *)inTitle authors:(NSArray *)inAuthors URLString:(NSString *)inURLString {
    return [[[self alloc] initWithTitle:inTitle authors:inAuthors URLString:inURLString] autorelease];
}

- (id)initWithTitle:(NSString *)inTitle authors:(NSArray *)inAuthors URLString:(NSString *)inURLString {
    if ((self = [super init])) {
        [self setBookTitle:inTitle];
        [self setAuthors:inAuthors];
        [self setURLString:inURLString];
    }
    return self;
}

+ (NSArray *)demoBookList {
    return [NSArray arrayWithObjects:
            [PRPBookInfo infoWithTitle:@"iOS Recipes" authors:[NSArray arrayWithObjects:@"Drance", @"Warren", nil] URLString:@"http://www.pragprog.com/titles/cdirec/ios-recipes"],
            [PRPBookInfo infoWithTitle:@"iPad Programming" authors:[NSArray arrayWithObjects:@"Steinberg", @"Freeman", nil] URLString:@"http://www.pragprog.com/titles/sfipad/ipad-programming"],
            [PRPBookInfo infoWithTitle:@"iPhone SDK Development" authors:[NSArray arrayWithObjects:@"Dudney", @"Adamson", nil] URLString:@"http://www.pragprog.com/titles/amiphd/iphone-sdk-development"],
            [PRPBookInfo infoWithTitle:@"Cocoa Programming" authors:[NSArray arrayWithObjects:@"Steinberg", nil] URLString:@"http://www.pragprog.com/titles/dscpq/cocoa-programming"],
            [PRPBookInfo infoWithTitle:@"Core Animation" authors:[NSArray arrayWithObjects:@"Dudney", nil] URLString:@"http://www.pragprog.com/titles/bdcora/core-animation-for-mac-os-x-and-the-iphone"],
            [PRPBookInfo infoWithTitle:@"Core Data" authors:[NSArray arrayWithObjects:@"Zarra", nil] URLString:@"http://www.pragprog.com/titles/mzcd/core-data"],
            [PRPBookInfo infoWithTitle:@"Beginning Mac Programming" authors:[NSArray arrayWithObjects:@"Isted", nil] URLString:@"http://www.pragprog.com/titles/tibmac/beginning-mac-programming"],
            [PRPBookInfo infoWithTitle:@"TextMate" authors:[NSArray arrayWithObjects:@"Gray", nil] URLString:@"http://www.pragprog.com/titles/textmate/textmate"],
            [PRPBookInfo infoWithTitle:@"Programming Cocoa With Ruby" authors:[NSArray arrayWithObjects:@"Marick", nil] URLString:@"http://www.pragprog.com/titles/bmrc/programming-cocoa-with-ruby"],
            nil];
}

@end
