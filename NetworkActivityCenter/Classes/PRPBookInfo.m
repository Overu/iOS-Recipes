/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "PRPBookInfo.h"

@implementation PRPBookInfo

@synthesize title;
@synthesize URL;

+ (id)bookInfoWithTitle:(NSString *)titleString URL:(NSURL *)url {
    return [[[self alloc] initWithTitle:titleString URL:url] autorelease];
}

- (id)initWithTitle:(NSString *)titleString URL:(NSURL *)url {
    if ((self = [super init])) {
        title = [titleString copy];
        URL = [url retain];
    }
    
    return self;
}

- (void)dealloc {
    [title release], title = nil;
    [URL release], URL = nil;
    [super dealloc];
}

@end