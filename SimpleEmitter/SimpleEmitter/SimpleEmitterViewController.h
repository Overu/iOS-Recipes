/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  SimpleEmitterViewController.h
//  SimpleEmitter
//
//  Created by Paul Warren on 2/13/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPSimpleEmitterLayer.h"

@interface SimpleEmitterViewController : UIViewController {}

@property (nonatomic, retain)  PRPSimpleEmitterLayer *emitter1;
@property (nonatomic, retain)  PRPSimpleEmitterLayer *emitter2;
@property (nonatomic, retain)  PRPSimpleEmitterLayer *emitter3;
@property (nonatomic, retain)  PRPSimpleEmitterLayer *emitter4;

@end
