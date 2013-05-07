/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  SpinNumbers control
//
//  copyright Primitve Dog Software
//

#import "SpinNumbers.h"

#define RADIANS(degrees) degrees * M_PI / 180
#define STARTNUM 1
#define NUM 10
#define ACCELERATIONFACTOR 12
#define CIRCLE 360

@interface SpinNumbers ()

@property (nonatomic, retain) CALayer *transformed;
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIImageView *backImage;
@property (nonatomic, assign) CGFloat previousXPosition;
@property (nonatomic, assign) CGFloat flick;
@property (nonatomic, assign) CGFloat beganLocation;
@property (nonatomic, assign) CGFloat currentAngle;
@property (nonatomic, assign) CGFloat newAngle;
@property (nonatomic, assign) NSTimeInterval prevousTimeStamp;
@property (nonatomic, assign) int cubeSize;
@property (nonatomic, assign) int currentTileNum;
@property (nonatomic, assign) CGFloat rotAngle;
@property (nonatomic, assign) CGRect tileRect;

- (void) setup;
- (CALayer*) makeSurface:(CATransform3D)t; 

@end

@implementation SpinNumbers

@synthesize cubeSize;
@synthesize transformed;
@synthesize label;
@synthesize backImage;
@synthesize previousXPosition;
@synthesize prevousTimeStamp;
@synthesize flick;
@synthesize beganLocation;
@synthesize currentAngle;
@synthesize newAngle;
@synthesize currentTileNum;
@synthesize rotAngle;
@synthesize tileRect;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setup];
    }
    return self;
}

- (void)dealloc {
    [label release]; label = nil;
    [backImage release]; backImage = nil;
    [super dealloc];
}

- (void)setup 
{
    CGFloat width = self.bounds.size.width;
    self.cubeSize = self.bounds.size.height; 
    self.tileRect = CGRectMake(0, 0, self.cubeSize, self.cubeSize);
    self.transformed = [CALayer layer];
    self.transformed.frame = self.bounds;
    self.transformed.backgroundColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:self.transformed];
    
    CATransform3D t = CATransform3DMakeTranslation((width-self.cubeSize)/2, 0, 0);
    
    for (int i =STARTNUM; i <= NUM ; i++) {
        self.label.text = [NSString stringWithFormat:@"%d",i];
        [self.transformed addSublayer:[self makeSurface:t]]; 
        t = CATransform3DRotate(t, RADIANS(self.rotAngle), 0, 1, 0);
        t = CATransform3DTranslate(t, self.cubeSize, 0, 0);
    }	
    self.currentAngle = 0;
    self.currentTileNum = 0;
    
    CALayer *leftFade = [CALayer layer];
    leftFade.frame = CGRectMake(0, 0, width/2-5, self.cubeSize);
    leftFade.contents = (id)[UIImage imageNamed:@"leftFade.png"].CGImage;
    leftFade.opacity = 0.5;
    [self.layer addSublayer:leftFade];
    
    CALayer *rightFade = [CALayer layer];
    rightFade.frame = CGRectMake(width/2+5, 0, width/2, self.cubeSize);
    rightFade.contents = (id)[UIImage imageNamed:@"rightFade.png"].CGImage;
    rightFade.opacity = 0.5;    
    [self.layer addSublayer:rightFade];	
}

- (UILabel *)label
{
    if (!label) {
        label = [[UILabel alloc] initWithFrame:self.tileRect];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:self.cubeSize/1.4];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.shadowColor = [UIColor blackColor];
    }
    return label;
}

- (UIImageView *)backImage
{
    if (!backImage) {
        backImage = [[UIImageView alloc] initWithImage:
                        [UIImage imageNamed:@"redBackground.png"]];		
        backImage.frame = self.tileRect;
        backImage.backgroundColor = [UIColor blackColor];
        [backImage addSubview:self.label];
    }
    return backImage;
}

- (CALayer*)makeSurface:(CATransform3D)t 
{
    self.rotAngle = CIRCLE/NUM;
    CALayer *imageLayer = [CALayer layer];
    imageLayer.anchorPoint = CGPointMake(1, 1);
    float factor = (cos(RADIANS(self.rotAngle/2))/sin(RADIANS(self.rotAngle/2)))/2;
    imageLayer.zPosition = self.cubeSize*factor;
    imageLayer.frame = self.tileRect;
    imageLayer.transform = t;  

    imageLayer.contents = (id)[self.backImage PRPCompositeView].CGImage;
    
    return imageLayer;
}

- (BOOL)beginTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event
{
    CGPoint location = [touch locationInView:self];	
    self.flick = 0;
    self.previousXPosition = location.x;
    self.beganLocation = location.x;
    newAngle = self.currentAngle;
    
    [self sendActionsForControlEvents:UIControlEventTouchDown];	
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:self];
    NSTimeInterval time = [touch timestamp];

    CGFloat locationDiff = self.beganLocation - location.x;
    self.flick = (self.previousXPosition-location.x)/(time-self.prevousTimeStamp);
    self.previousXPosition = location.x;
    self.prevousTimeStamp = time;
    self.newAngle = self.currentAngle - locationDiff/300*160;
    if (self.newAngle >= CIRCLE) self.newAngle -= CIRCLE;
    else if (self.newAngle < 0) self.newAngle += CIRCLE;

    [CATransaction setDisableActions:YES];
    self.transformed.sublayerTransform = 
                CATransform3DMakeRotation(RADIANS(newAngle), 0, 1, 0);
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:self];
    CGFloat halfWidth = self.bounds.size.width/2;
    int newNum = 0;
    if (self.flick == 0)
    {
        if (location.x > halfWidth + self.cubeSize/2) newNum = -1;
        if (location.x < halfWidth - self.cubeSize/2) newNum = 1;		
    } else {		
        newNum = self.flick / ACCELERATIONFACTOR;
        if (newNum > 150) newNum = 150;
        if (newNum < -150) newNum = -150;
    }			
    self.newAngle = self.newAngle-newNum;
    if (self.newAngle < 0) self.newAngle = CIRCLE+self.newAngle;
    int tileNum = self.rotAngle/2;
    tileNum += self.newAngle;
    tileNum = tileNum%CIRCLE;
    tileNum = tileNum/self.rotAngle;
    tileNum = abs(tileNum-NUM)%NUM;

    [self moveToNewNumber:tileNum];
}	

-(void)moveToNewNumber:(int)newNumber
{
    self.newAngle = CIRCLE-newNumber*self.rotAngle; 	
    [CATransaction setValue:[NSNumber numberWithFloat:.5]
                     forKey:kCATransactionAnimationDuration];	
    self.transformed.sublayerTransform = 
                    CATransform3DMakeRotation(RADIANS(self.newAngle), 0, 1, 0);
    self.currentTileNum = newNumber;
    self.currentAngle = self.newAngle;
    [self sendActionsForControlEvents: UIControlEventValueChanged];		
}

- (int)currentNumber
{
    return self.currentTileNum+STARTNUM;
}

@end
