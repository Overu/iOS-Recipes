/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPTileView.m
//  InfiniteImages
//
//  Created by Paul Warren
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import "PRPTileView.h"
#import <QuartzCore/CATiledLayer.h>

#define SIZE 128

@interface PRPTileView ()

@property (nonatomic, copy)  NSArray *albumCollections;

@end

@implementation PRPTileView

@synthesize albumCollections;

+ (Class)layerClass {
    return [PRPTiledLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        PRPTiledLayer *tiledLayer = (PRPTiledLayer *)[self layer];
        CGFloat sf = self.contentScaleFactor;
        tiledLayer.tileSize = CGSizeMake(SIZE*sf, SIZE*sf);

        MPMediaQuery *everything = [MPMediaQuery albumsQuery];
        self.albumCollections = [everything collections];		
    }
    return self;
}

- (void)dealloc {
    [albumCollections release]; albumCollections=nil;
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
    
    int col = rect.origin.x / SIZE;
    int row = rect.origin.y / SIZE;
    int columns = self.bounds.size.width/SIZE;
    UIImage *tile = [self tileAtPosition:row*columns+col];
    
    [tile drawInRect:rect];
}

- (UIImage *)tileAtPosition:(int)position
{
    int albums = [self.albumCollections count];
    if (albums == 0) {
        return [UIImage imageNamed:@"missing.png"];
	}
	
    int index = position%albums;
	
    MPMediaItemCollection *mCollection = [self.albumCollections 
                                                 objectAtIndex:index];
    MPMediaItem *mItem = [mCollection representativeItem];
    MPMediaItemArtwork *artwork =
	            [mItem valueForProperty: MPMediaItemPropertyArtwork];
	
    UIImage *image = [artwork imageWithSize: CGSizeMake(SIZE, SIZE)];
    if (!image) image = [UIImage imageNamed:@"missing.png"];

    return image;
}


@end
