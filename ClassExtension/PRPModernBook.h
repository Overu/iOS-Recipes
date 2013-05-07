/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPModernBook.h
//  ClassExtension
//
//  Created by Matt Drance on 10/1/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRPModernBook : NSObject {}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *authors;

@property (nonatomic, assign, readonly, getter=isInStock) BOOL inStock;

@end
