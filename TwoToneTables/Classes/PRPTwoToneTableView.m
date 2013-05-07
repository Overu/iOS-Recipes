/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "PRPTwoToneTableView.h"

@interface PRPTwoToneTableView ()

@property (nonatomic, retain) UIView *topStretcher;
@property (nonatomic, retain) UIView *bottomStretcher;

@end


@implementation PRPTwoToneTableView

@dynamic topColor;
@dynamic bottomColor;

@synthesize topStretcher;
@synthesize bottomStretcher;

- (void)dealloc {
    [topStretcher release], topStretcher = nil;
    [bottomStretcher release], bottomStretcher = nil;
    
    [super dealloc];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.topStretcher) {
        if (self.contentOffset.y > 0) {
            self.topStretcher.hidden = YES;        
        } else {
            self.topStretcher.frame = CGRectMake(0, self.contentOffset.y,
                                                 self.frame.size.width,
                                                 -self.contentOffset.y);
            self.topStretcher.hidden = NO;
        }
    }
    
    CGFloat contentBottom = (self.contentSize.height - self.contentOffset.y);
    CGFloat bottomGap = self.frame.size.height - contentBottom;
    if ((bottomGap > 0) && self.bottomStretcher) {
        if (self.contentOffset.y < 0) {
            self.bottomStretcher.hidden = YES;        
        } else {
            self.bottomStretcher.frame = CGRectMake(0, self.contentSize.height,
                                                    self.frame.size.width,
                                                    bottomGap);
            self.bottomStretcher.hidden = NO;
        } 
    } else {
        self.bottomStretcher.hidden = YES;
    }
}

- (UIColor *)topColor {
    return self.topStretcher.backgroundColor;
}

- (void)setTopColor:(UIColor *)color {
    if (self.topStretcher == nil) {
        topStretcher = [[UIView alloc] initWithFrame:CGRectZero];        
        [self addSubview:self.topStretcher];
    }
	
    if (self.topStretcher.backgroundColor != color) {
        self.topStretcher.backgroundColor = color;
    }
}

- (UIColor *)bottomColor {
    return self.bottomStretcher.backgroundColor;
}

- (void)setBottomColor:(UIColor *)color {
    if (self.bottomStretcher == nil) {
        bottomStretcher = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.bottomStretcher];        
    }

    if (self.bottomStretcher.backgroundColor != color) {
        self.bottomStretcher.backgroundColor = color;
    }
}


@end