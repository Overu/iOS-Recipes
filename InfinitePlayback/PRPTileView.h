/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPTileView.h
//  InfiniteImages
//
//  Created by Paul Warren
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PRPTiledLayer.h"


@interface PRPTileView : UIView {
	
	int columns;
	int albums;
}

- (UIImage *)tileAtPosition:(int)position;
- (MPMediaItemCollection *)collectionFromTouch:(CGPoint)touchPoint;
@end
