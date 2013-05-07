/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPMusicViewController.m
//  InfiniteImages
//
//  Created by Paul Warren on 2/23/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import "PRPMusicViewController.h"


@implementation PRPMusicViewController
@synthesize albumCover;
@synthesize mCollection;
@synthesize albumName;
@synthesize trackName;
@synthesize myPlayer;
@synthesize playPauseButton;

- (void)dealloc
{
    [super dealloc];
    [mCollection release]; mCollection=nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    myPlayer = [[MPMusicPlayerController applicationMusicPlayer] retain];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter 
                                                            defaultCenter];														
    [notificationCenter
     addObserver: self
     selector:    @selector (playingItemChanged:)
     name:        MPMusicPlayerControllerNowPlayingItemDidChangeNotification
     object:      myPlayer];
	 
    [notificationCenter
     addObserver: self
     selector:    @selector (playbackStateChanged:)
     name:        MPMusicPlayerControllerPlaybackStateDidChangeNotification
     object:      myPlayer];
	 
    [myPlayer beginGeneratingPlaybackNotifications];    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    MPMediaItem *mItem = [self.mCollection representativeItem];
    MPMediaItemArtwork *artwork =
    [mItem valueForProperty: MPMediaItemPropertyArtwork];
    UIImage *image = [artwork imageWithSize: CGSizeMake(280, 280)];
    if (!image) image = [UIImage imageNamed:@"missing.png"];
    self.albumCover.image = image;
    [myPlayer setQueueWithItemCollection: self.mCollection];
    [myPlayer play];
}

- (IBAction)playButton:(UIButton *)sender { 
    if (myPlayer.playbackState == MPMoviePlaybackStatePlaying) {
        [myPlayer pause];
    } else {
        [myPlayer play];
    }
}

- (IBAction)backButton:(id)sender {
    
    [myPlayer skipToPreviousItem];
}

- (IBAction)nextButton:(id)sender {

    [myPlayer skipToNextItem];
}

- (void)playingItemChanged: (id) notification {
    MPMediaItem *currentItem = [myPlayer nowPlayingItem];
    albumName.text = [currentItem valueForProperty: 
                                            MPMediaItemPropertyAlbumTitle];
    trackName.text = [currentItem valueForProperty: 
                                            MPMediaItemPropertyTitle];   
    if (myPlayer.playbackState == MPMusicPlaybackStateStopped) {
        trackName.text = @"PlayBack Complete";
    }
}

- (void)playbackStateChanged: (id) notification { 
    MPMusicPlaybackState playerState = [myPlayer playbackState];

    if (playerState == MPMusicPlaybackStatePaused) {       
        [playPauseButton setImage:[UIImage imageNamed:
                                        @"mediumPlayButton.png"] 
                                        forState:UIControlStateNormal];		
    } else if (playerState == MPMusicPlaybackStatePlaying) {
        [playPauseButton setImage:[UIImage imageNamed:
                                        @"mediumPauseButton.png"] 
                                        forState:UIControlStateNormal];
    } else if (playerState == MPMusicPlaybackStateStopped) {    
        [playPauseButton setImage:[UIImage imageNamed:
                                        @"mediumPlayButton.png"] 
                                        forState:UIControlStateNormal];
        [myPlayer stop];
    }    
}

- (void)ZoomInView {
    
    self.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.fromValue = [NSNumber numberWithFloat:0];
    anim.toValue = [NSNumber numberWithFloat:1.0];
    [self.view.layer addAnimation:anim forKey:@"scaleIn"];
}

- (void)ZoomOutView {
        
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.fromValue = [NSNumber numberWithFloat:1.0];
    anim.toValue = [NSNumber numberWithFloat:0];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeBoth;
    anim.delegate = self;
    [self.view.layer addAnimation:anim forKey:@"scaleOut"];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
    
    [self.view.layer removeAllAnimations];
    [self.view removeFromSuperview];   
}


- (void)viewDidUnload
{
    [albumCover release]; albumCover=nil;
    [albumName release]; albumName=nil;
    [trackName release]; trackName=nil;
    [playPauseButton release]; playPauseButton=nil;
    [myPlayer release]; myPlayer=nil;

    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
