/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  MainViewController.h
//  OpeningTransition
//
//  Created by Paul Warren
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PRPTileView.h"
#import "PRPMusicViewController.h"

@interface MainViewController : UIViewController <UIScrollViewDelegate> {
    
    CGFloat width;
    CGFloat height;
    BOOL showingAlbum;
    PRPMusicViewController *musicController;
}

@end

