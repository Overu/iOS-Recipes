/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPAttributedLabel.m
//  coreText
//
//  Created by Paul Warren on 2/8/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import "PRPAttributedLabel.h"


@implementation PRPAttributedLabel

@synthesize attributedText;

- (void)dealloc {
    [attributedText release]; attributedText = nil;
    [super dealloc];
}

- (void)setAttributedText:(NSAttributedString *)newAttributedText {
    if (attributedText != newAttributedText) {
        [attributedText release];
        attributedText = [newAttributedText copy];
        [self setNeedsDisplay];  
    }    
}

- (void)drawRect:(CGRect)rect {
	if (self.attributedText == nil) 
		return;   
	CGContextRef context = UIGraphicsGetCurrentContext(); 		
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, self.bounds.size.width/2, 
                                self.bounds.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);	
	CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef) 
                                                      self.attributedText);	
	CGContextSetTextPosition(context, ceill(-self.bounds.size.width/2), 
                                ceill(self.bounds.size.height/4));
	CTLineDraw(line, context);
	CGContextRestoreGState(context);	
	CFRelease(line);	
}
    

@end
