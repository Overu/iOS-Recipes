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
//  OpeningTransition
//
//  Created by Paul Warren on 9/18/10.
//  Copyright 2010 Primitive Dog Software. All rights reserved.
//

#import "MainViewController.h"
#define DURATION 20

@implementation MainViewController


- (void) addGradient {
    
    GradientView *gradView = [[GradientView alloc] initWithFrame:
                                                        self.view.bounds];
    [self.view addSubview:gradView];
    [gradView release];        
}

- (void) addCloud {
    
    CGFloat cloudWidth = width/2;
    CGFloat cloudHeight = cloudWidth*0.5;
    CGFloat cloudYPos = height/7;
    
    CGRect cRect = CGRectMake(-cloudWidth, cloudYPos, cloudWidth, cloudHeight);
    PRPCloud *cloud = [[PRPCloud alloc] initWithFrame:cRect];
    cloud.outerColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    cloud.innerColor = [UIColor colorWithRed:1 green:1 blue:.5 alpha:1];
    [self.view addSubview:cloud];
    [cloud release];

    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position";
    CGPoint pos = CGPointMake(width+cloudWidth/2, cloudYPos+cloudHeight/2);
    anim.toValue = [NSValue valueWithCGPoint:pos];
    anim.duration = DURATION;
    anim.repeatCount = MAXFLOAT;
    [cloud.layer addAnimation:anim forKey:@"pos"];
}

- (void) growUp:(UIImageView *)grower forDuration:(CGFloat)time {
    
    grower.layer.anchorPoint = CGPointMake(0.5, 1);
    CABasicAnimation *growAnim = [CABasicAnimation animation];
    growAnim.keyPath = @"transform.scale";
    growAnim.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    growAnim.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    growAnim.duration = time;
    [grower.layer addAnimation:growAnim forKey:@"grow"];    
}

- (void) addFlowers {
    
    int pos = height*0.3;
    CGFloat imageSize = height/6;
    CGRect flowerRect = CGRectMake(0,0, imageSize*0.7, imageSize);
    
    PRPFlower *flower = [[PRPFlower alloc] initWithFrame:flowerRect];
    UIImage *compositeFlower = [flower PRPCompositeView];
    [flower release];
    
    for (int i = 0; i < 60; i++) {
        int size = height/12;
        CGFloat flowerSize = arc4random()%size+size;
        CGRect flowerRect = CGRectMake(arc4random()%(int)width*0.9,
                                       arc4random()%pos+2*pos , 
                                       flowerSize*0.7, 
                                       flowerSize);
        UIImageView *compView = [[UIImageView alloc] initWithFrame:flowerRect];
        compView.image = compositeFlower;        
        compView.layer.zPosition = flowerRect.origin.y+flowerSize;
        [self.view addSubview:compView];
        [compView release];
        [self growUp:compView forDuration:arc4random()%100/25.0+4];
    }
}

- (void) addSunShine {
    
    CGRect sunRect = CGRectMake(width*0.7, 0, width/4, height/4);
    PRPSunshine *newSun = [[PRPSunshine alloc] initWithFrame:sunRect];
    [self.view addSubview:newSun];
    [newSun release];    
}

- (void) addBird {
    
    CGRect rect = CGRectMake(-width/5, width/8, width/8, height/8);
    PRPBird *bird = [[PRPBird alloc] initWithFrame:rect];
    [self.view addSubview:bird];
    [bird release];
    bird.animationDuration = 1.0;
    [bird startAnimating];
    
    CABasicAnimation *birdAnim = [CABasicAnimation animation];
    birdAnim.keyPath = @"position";
    CGPoint birdPos = CGPointMake(width, bird.center.y*2);
    birdAnim.toValue = [NSValue valueWithCGPoint:birdPos];
    birdAnim.duration = DURATION/2;
    birdAnim.repeatCount = MAXFLOAT;
    [bird.layer addAnimation:birdAnim forKey:@"pos"];    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:.2 green:0.4 blue:1 alpha:1]; 
    width = self.view.bounds.size.width;
    height = self.view.bounds.size.height;
}

- (void)viewDidAppear:(BOOL)animated {

    [self addGradient];    
    [self addFlowers];
    [self addSunShine];
    [self addCloud];
    [self addBird];    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {

    [super dealloc];
}


@end

