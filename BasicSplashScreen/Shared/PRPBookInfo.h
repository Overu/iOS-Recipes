/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPBookInfo.h
//  BasicSplashScreen
//
//  Created by Matt Drance on 3/21/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PRPBookInfo : NSObject {}

@property (nonatomic, copy) NSString *bookTitle;
@property (nonatomic, copy) NSArray *authors;
@property (nonatomic, copy) NSString *URLString;

+ (id)infoWithTitle:(NSString *)title authors:(NSArray *)authors URLString:(NSString *)URLString;
+ (NSArray *)demoBookList;

- (id)initWithTitle:(NSString *)inTitle authors:(NSArray *)inAuthors URLString:(NSString *)inURLString;

@end