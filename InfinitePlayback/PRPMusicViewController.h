/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPMusicViewController.h
//  InfiniteImages
//
//  Created by Paul Warren on 2/23/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PRPMusicViewController : UIViewController {}

@property (nonatomic, retain) IBOutlet UIImageView *albumCover;
@property (nonatomic, retain) IBOutlet UILabel *albumName;
@property (nonatomic, retain) IBOutlet UILabel *trackName;
@property (nonatomic, retain) IBOutlet UIButton *playPauseButton;

@property (nonatomic, retain) MPMediaItemCollection *mCollection;
@property (nonatomic, retain) MPMusicPlayerController *myPlayer;

- (IBAction)playButton:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (void)ZoomInView;
- (void)ZoomOutView;
@end
