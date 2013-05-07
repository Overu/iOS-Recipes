/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "PRPShadowedTableView.h"

@interface PRPShadowedTableView ()

@property (nonatomic, retain) UIImageView *topShadow;
@property (nonatomic, retain) UIImageView *bottomShadow;
@property (nonatomic, retain) UIImageView *contentTopShadow;
@property (nonatomic, retain) UIImageView *contentBottomShadow;
@property (nonatomic, retain) UIView *placeholderFooter;

- (void)commonInit;
- (void)installShadows;
- (void)installShadow:(UIImageView *)shadowView;
- (void)updateShadows;

@end

@implementation PRPShadowedTableView

@synthesize topShadow, bottomShadow, contentTopShadow, contentBottomShadow;
@synthesize placeholderFooter;

- (void)dealloc {
    [topShadow release], topShadow = nil;
    [bottomShadow release], bottomShadow = nil;
    [contentTopShadow release], contentTopShadow = nil;
    [contentBottomShadow release], contentBottomShadow = nil;
    [placeholderFooter release], placeholderFooter = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Initialization

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame style:UITableViewStylePlain])) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    return [super initWithFrame:frame];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self installShadows];
}


- (void)installShadows {
    UIImage *upShadow = [UIImage imageNamed:@"shadowUp.png"];
    UIImage *downShadow = [UIImage imageNamed:@"shadowDown.png"];
    
    if (topShadow == nil) {
        topShadow = [[UIImageView alloc] initWithImage:downShadow];
        [self installShadow:topShadow];
    }
    
    if (bottomShadow == nil) {
        bottomShadow = [[UIImageView alloc] initWithImage:upShadow];
        [self installShadow:bottomShadow];
    }
    
    if (contentTopShadow == nil) {
        contentTopShadow = [[UIImageView alloc] initWithImage:upShadow];
        [self installShadow:contentTopShadow];
        CGRect topShadowFrame = contentTopShadow.frame;
        topShadowFrame.origin.y = -topShadowFrame.size.height;
        contentTopShadow.frame = topShadowFrame; 
    }
    
    if (contentBottomShadow == nil) {
        contentBottomShadow = [[UIImageView alloc] initWithImage:downShadow];
        [self installShadow:contentBottomShadow];
    }
}

- (void)repositionShadow:(UIImageView *)shadowView {
    if (self.backgroundView) {
        [self insertSubview:shadowView aboveSubview:self.backgroundView];
    } else {
        [self insertSubview:shadowView atIndex:0];
    }
}

- (void)installShadow:(UIImageView *)shadowView {    
    shadowView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    CGRect contentFrame = shadowView.frame;
    contentFrame.size.width = self.frame.size.width;
    shadowView.frame = contentFrame;
    [self repositionShadow:shadowView];
}

- (void)updateShadows {
    BOOL topShowing = (self.contentOffset.y < 0);
    if (topShowing) {
        CGRect topFrame = self.topShadow.frame;
        topFrame.origin.y = self.contentOffset.y;
        self.topShadow.frame = topFrame;            
        [self repositionShadow:self.topShadow];
        self.topShadow.hidden = NO;
        
        [self repositionShadow:self.contentTopShadow];
        self.contentTopShadow.hidden = NO;
    } else {
        self.topShadow.hidden = YES;
        self.contentTopShadow.hidden = YES;
    }
    
    CGFloat footerMaxY = CGRectGetMaxY(self.tableFooterView.frame);
    CGFloat bottomY = footerMaxY - self.contentOffset.y;
    BOOL bottomShowing = (bottomY < self.frame.size.height);
    if (bottomShowing) {
        CGFloat tableBottom = CGRectGetMaxY(self.frame);
        CGRect bottomFrame = self.bottomShadow.frame;
        CGFloat yOffset = (bottomFrame.size.height - self.contentOffset.y);
        CGFloat bottomY = tableBottom - yOffset;
        bottomFrame.origin.y = bottomY;
        self.bottomShadow.frame = bottomFrame;
        [self repositionShadow:self.bottomShadow];
        self.bottomShadow.hidden = NO;
        
        CGRect cbFrame = self.contentBottomShadow.frame;
        cbFrame.origin.y = footerMaxY;
        self.contentBottomShadow.frame = cbFrame;
        [self repositionShadow:self.contentBottomShadow];        
        self.contentBottomShadow.hidden = NO;
    } else {
        self.bottomShadow.hidden = YES;
        self.contentBottomShadow.hidden = YES;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateShadows];
}

#pragma mark -
#pragma mark Accessor overrides
- (UIView *)tableFooterView {
    UIView *footer = [super tableFooterView];
    if (footer == nil) {
        if (self.placeholderFooter == nil) {
            CGRect footerFrame = self.frame;
            footerFrame.size.height = 0;
            placeholderFooter = [[UIView alloc] initWithFrame:footerFrame];
        }
        self.placeholderFooter.hidden = YES;
        footer = self.tableFooterView = self.placeholderFooter;
    }
    
    return footer;
}

@end