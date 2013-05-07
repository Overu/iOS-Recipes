/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPModernBook.m
//  ClassExtension
//
//  Created by Matt Drance on 10/1/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPModernBook.h"

@interface PRPModernBook ()

@property (nonatomic, retain) id privateContext;
@property (nonatomic, assign, readwrite, getter=isInStock) BOOL inStock;

- (void)refreshStock;

@end

@implementation PRPModernBook

@synthesize title;
@synthesize authors;
@synthesize inStock;
@synthesize privateContext;

- (void)dealloc {
    [title release], title = nil;
    [authors release], authors = nil;
    [privateContext release], privateContext = nil;
    [super dealloc];
}

- (id)init {
    if ((self = [super init])) {
        [self refreshStock];
    }
    return self;
}

- (void)refreshStock {
    // ...
}

@end
