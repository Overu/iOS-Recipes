/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import <Foundation/Foundation.h>

@interface PRPBookInfo : NSObject {
    NSString *title;
    NSURL *URL;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSURL *URL;

+ (id)bookInfoWithTitle:(NSString *)titleString URL:(NSURL *)url;
- (id)initWithTitle:(NSString *)title URL:(NSURL *)URL;

@end