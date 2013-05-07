/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  UIView+PRPSubviewTraversal.m
//  PrintSubviews
//
//  Created by Matt Drance on 1/25/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

@implementation UIView (PRPSubviewTraversal)

- (void)prp_printSubviewsWithIndentString:(NSString *)indentString {
    if (indentString == nil) indentString = @"";
    
    NSString *viewDescription = NSStringFromClass([self class]);
    
    printf("%s+-%s\n", [indentString UTF8String], 
                       [viewDescription UTF8String]);
    
    if (self.subviews) {
        NSArray *siblings = self.superview.subviews;
        if ([siblings count] > 1 && 
            ([siblings indexOfObject:self] < [siblings count]-1)) {
            indentString = [indentString stringByAppendingString:@"| "];
        } else {
            indentString = [indentString stringByAppendingString:@"  "];
        }
        
        for (UIView *subview in self.subviews) {
            [subview prp_printSubviewsWithIndentString:indentString];
        }
    }
}

- (void)prp_printSubviews {
    [self prp_printSubviewsWithIndentString:nil];
}

- (void)prp_populateSubviewsMatchingClass:(Class)aClass 
                                  inArray:(NSMutableArray *)array 
                               exactMatch:(BOOL)exactMatch {
    if (exactMatch) {
        if ([self isMemberOfClass:aClass]) {
            [array addObject:self];
        }
    } else {
        if ([self isKindOfClass:aClass]) {
            [array addObject:self];
        }        
    }
    for (UIView *subview in self.subviews) {
        [subview prp_populateSubviewsMatchingClass:aClass 
                                           inArray:array 
                                        exactMatch:exactMatch];
    }
}

- (NSArray *)prp_subviewsMatchingClass:(Class)aClass {
    NSMutableArray *array = [NSMutableArray array];
    [self prp_populateSubviewsMatchingClass:aClass 
                                    inArray:array 
                                 exactMatch:YES];
    return array;
}

- (NSArray *)prp_subviewsMatchingOrInheritingClass:(Class)aClass {
    NSMutableArray *array = [NSMutableArray array];
    [self prp_populateSubviewsMatchingClass:aClass 
                                    inArray:array 
                                 exactMatch:NO];
    return array;    
}

@end