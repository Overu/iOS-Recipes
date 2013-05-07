/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  UIView+PRPSubviewTraversal.h
//  PrintSubviews
//
//  Created by Matt Drance on 1/25/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PRPSubviewTraversal)

- (void)prp_printSubviews;
- (void)prp_printSubviewsWithIndentString:(NSString *)indentString;

- (NSArray *)prp_subviewsMatchingClass:(Class)aClass;
- (NSArray *)prp_subviewsMatchingOrInheritingClass:(Class)aClass;
- (void)prp_populateSubviewsOfClass:(Class)aClass 
                            inArray:(NSMutableArray *)array 
                         exactMatch:(BOOL)exactMatch;
@end
