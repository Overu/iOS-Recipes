/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  SimpleEmitterViewController.m
//  SimpleEmitter
//
//  Created by Paul Warren on 2/13/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import "SimpleEmitterViewController.h"

@implementation SimpleEmitterViewController

@synthesize emitter1;
@synthesize emitter4;
@synthesize emitter3;
@synthesize emitter2;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


-(PRPSimpleEmitterLayer *)emitter1 {

    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    PRPSimpleEmitterLayer *emitter = 
                        [PRPSimpleEmitterLayer layer];
    emitter.frame = CGRectMake(w/4, h/2, 16,16);
    emitter.rotator = -M_PI*4/50;
    emitter.length = w/4;
    emitter.count = 100;
    emitter.angle = 2.5;
    emitter.cycleTime = 1.0;
    emitter.instanceGreenOffset = -0.1/emitter.count;
    emitter.instanceRedOffset = -0.5/emitter.count;
    emitter.instanceBlueOffset = -0.1/emitter.count;
    [self.view.layer addSublayer:emitter];
    return emitter;
}

-(PRPSimpleEmitterLayer *)emitter2 {
    
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    PRPSimpleEmitterLayer *emitter = 
                        [PRPSimpleEmitterLayer layer];
    emitter.frame = CGRectMake(w/4*3, h/4, 16,16);
    emitter.rotator = M_PI*4/100;
    emitter.length = w/4;
    emitter.count = 100;
    emitter.angle = 2.5;
    emitter.cycleTime = 2.0;
    emitter.xAdjust = 5;
    emitter.yAdjust = 5;
    emitter.instanceGreenOffset = 0.1/emitter.count;
    emitter.instanceRedOffset = -0.5/emitter.count;
    emitter.instanceBlueOffset = -0.1/emitter.count;
    [self.view.layer addSublayer:emitter];
    return emitter;
}

-(PRPSimpleEmitterLayer *)emitter3 {
    
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    PRPSimpleEmitterLayer *emitter = 
                        [PRPSimpleEmitterLayer layer];
    emitter.frame = CGRectMake(w, h/2, 32,32);
    emitter.length = w;
    emitter.count = 10;
    emitter.angle = 2.1;
    emitter.cycleTime = 1.0;
    [self.view.layer addSublayer:emitter];
    return emitter;
}

-(PRPSimpleEmitterLayer *)emitter4 {
    
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    PRPSimpleEmitterLayer *emitter = 
                        [PRPSimpleEmitterLayer layer];
    emitter.frame = CGRectMake(0, h, 16,16);
    emitter.rotator = 0.02;
    emitter.length = w;
    emitter.count = 6;
    emitter.angle = 4.0;
    emitter.cycleTime = 1.6;
    emitter.instanceColor = [UIColor redColor].CGColor;
    emitter.imageLayer.contents = 
                (id)[UIImage imageNamed:@"brightBlob.png"].CGImage;

    [self.view.layer addSublayer:emitter];
    return emitter;
}

-(void)startEmitter:(PRPSimpleEmitterLayer *)emitter {
    
    [emitter start];
    [self performSelector:@selector(stopEmitter:) 
                            withObject:emitter afterDelay:10];
}

-(void)stopEmitter:(PRPSimpleEmitterLayer *)emitter {
    
    [emitter stop];
    [self performSelector:@selector(startEmitter:) 
                            withObject:emitter afterDelay:4];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    emitter1 = [self emitter1];
    emitter2 = [self emitter2];
    emitter3 = [self emitter3];
    emitter4 = [self emitter4];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self performSelector:@selector(startEmitter:) 
                            withObject:emitter1 afterDelay:0];
    [self performSelector:@selector(startEmitter:) 
                            withObject:emitter2 afterDelay:2];
    [self performSelector:@selector(startEmitter:) 
                            withObject:emitter3 afterDelay:4];
    [self performSelector:@selector(startEmitter:) 
                            withObject:emitter4 afterDelay:6];    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
