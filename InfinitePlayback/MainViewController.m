/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  MainViewController.m
//  InfiniteImages
//
//  Created by Paul Warren
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import "MainViewController.h"
#define BIG 3010349
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    width = self.view.bounds.size.width;
    height = self.view.bounds.size.height;
    CGRect frameRect = CGRectMake(0, 0, width, height);
	
    UIScrollView *infScroller = [[UIScrollView alloc] 
                                             initWithFrame:frameRect];
    infScroller.contentSize = CGSizeMake(BIG, BIG);
    infScroller.delegate = self;
    infScroller.contentOffset = CGPointMake(BIG/2, BIG/2);
    infScroller.backgroundColor = [UIColor blackColor];
    infScroller.showsHorizontalScrollIndicator = NO;
    infScroller.showsVerticalScrollIndicator = NO;
    [self.view addSubview:infScroller];
    [infScroller release];
	
    CGRect infFrame = CGRectMake(0, 0, BIG, BIG);
    PRPTileView *tiles = [[PRPTileView alloc] initWithFrame:infFrame];

    [infScroller addSubview:tiles];
    [tiles release];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] 
                                            initWithTarget:self 
                                            action:@selector(tapDetected:)];								
    [tiles addGestureRecognizer:tap];
    [tap release]; 
    musicController = [[PRPMusicViewController alloc] 
                        initWithNibName:@"PRPMusicControllerView" bundle:nil];
    CGFloat xPos = (width-musicController.view.frame.size.width)/2;
    CGFloat yPos = (height-musicController.view.frame.size.height)/2;
    musicController.view.frame = CGRectOffset(musicController.view.frame, xPos, yPos);
    
}

- (void)tapDetected:(UITapGestureRecognizer *)tap { 
    PRPTileView *tiles = (PRPTileView *)tap.view;
    if (showingAlbum) {
        [musicController ZoomOutView];
        [musicController.myPlayer stop];
        showingAlbum = NO;
    } else {
        CGPoint tapPoint = [tap locationInView:tiles];
        MPMediaItemCollection *mCollection = [tiles 
                                            collectionFromTouch:tapPoint];
        musicController.mCollection = [MPMediaItemCollection 
                                    collectionWithItems:[mCollection items]];
        [musicController viewWillAppear:NO];
        [self.view addSubview:musicController.view];
        [musicController ZoomInView];
        showingAlbum = YES;
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {

    [super dealloc];
    [musicController release]; musicController=nil;
}


@end

