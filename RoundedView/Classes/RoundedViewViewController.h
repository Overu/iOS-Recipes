/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  RoundedViewViewController.h
//  RoundedView
//
//  Created by Paul Warren on 2/16/10.
//  Copyright Primitive Dog Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RoundedViewViewController : UIViewController {
    
    UIColor *thickColor;

}

-(UILabel *)centeredLabel:(CGRect)rect label:(NSString *)text;
@end

