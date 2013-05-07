/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  CustomSliderViewController.h
//  CustomSlider
//
//  Created by Paul Warren on 6/23/10.
//  Copyright Primitive Dog Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSliderViewController : UIViewController {
    
    CGFloat progression;
    NSTimer *timer;
}

@property (nonatomic, retain) IBOutlet UIProgressView *progress1;
@property (nonatomic, retain) IBOutlet UIProgressView *progress2;
@property (nonatomic, retain) IBOutlet UISlider *customSlider;
@property (nonatomic, retain) IBOutlet UISlider *customProgress;

- (IBAction)processSlider:(UISlider *)sender;
- (IBAction)processTimer:(UIButton *)sender;

@end



