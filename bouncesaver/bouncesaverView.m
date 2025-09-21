//  Created by jayw88 on 9/20/25
//  Copyright © 2025 jayw88. All rights reserved.
//

#import "bouncesaverView.h"
#define WIDTH ([NSScreen mainScreen].frame.size.width)
#define HEIGHT ([NSScreen mainScreen].frame.size.height)

// d = r * t
// r = d / t
// r = width / 10 seconds. 

@implementation bouncesaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        
        const float fps = 60.0f;
        [self setAnimationTimeInterval:1/fps];

        
        const int speed = WIDTH / (10.0 * fps); // adjust to any resolution.
        // makes the logo travel across the screen in 10 seconds.
       
        self.dvdWidth = 512;
        self.dvdHeight = 256;
        self.x = WIDTH / 2.0 - self.dvdWidth / 2.0;
        self.y = HEIGHT / 2.0 - self.dvdHeight / 2.0;
        self.dirtyRect = NSMakeRect(self.x, self.y, self.dvdWidth, self.dvdHeight);
        self.xSpeed = speed * (arc4random() % 2 == 0 ? 1 : -1);
        self.ySpeed = speed * (arc4random() % 2 == 0 ? 1 : -1);
        //self.dvdLogo = [[NSImage alloc] initWithContentsOfFile:@"/Users/briantracy/Desktop/Projects/bouncesaver/dvdlogo.png"];
        
        NSString * dvdPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"dvdlogo" ofType:@"png"];
        
        
        self.dvdLogo = [[NSImage alloc] initWithContentsOfFile:dvdPath];
        [self hitWall];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}



- (void)drawRect:(NSRect)rectParam
{
    const float g = 0.0f;
    [[NSColor colorWithRed:g green:g blue:g alpha:1.0f] setFill];
    NSRectFill(rectParam);
    NSRect rect;

    
    
    rect.size = NSMakeSize(self.dvdWidth, self.dvdHeight);
    
    self.x += self.xSpeed;
    self.y += self.ySpeed;
    rect.origin = CGPointMake(self.x, self.y);
    self.dirtyRect = rect;
    
    
    


    
    
    [self.dvdLogo drawInRect:rect];
    
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    
    
    
    if (center.x + self.dvdWidth / 2 >= WIDTH || center.x - self.dvdWidth / 2 <= 0) {
        self.xSpeed *= -1;
        [self hitWall];
    }
    
    if (center.y + self.dvdHeight / 2 >= HEIGHT || center.y - self.dvdHeight / 2 <= 0) {
        self.ySpeed *= -1;
        [self hitWall];
    }

}

- (void)hitWall
{
    NSArray *colors = @[[NSColor redColor],
                       [NSColor blueColor],
                       [NSColor yellowColor],
                       [NSColor cyanColor],
                       [NSColor orangeColor],
                       [NSColor magentaColor],
                       [NSColor greenColor],
                       [NSColor grayColor]];
    
    // Create a mutable copy of the colors array
    NSMutableArray *availableColors = [colors mutableCopy];
    
    // Remove the current color if it exists in the array
    if (self.dvdColor) {
        [availableColors removeObject:self.dvdColor];
    }
    
    // Randomly select a new color from the available colors
    if (availableColors.count > 0) {
        self.dvdColor = availableColors[arc4random() % availableColors.count];
    } else {
        // Fallback if all colors are removed (shouldn't happen with this setup)
        self.dvdColor = colors[arc4random() % colors.count];
    }
    
    [self.dvdLogo lockFocus];
    [self.dvdColor set];
    NSRect imageRect = {NSZeroPoint, [self.dvdLogo size]};
    NSRectFillUsingOperation(imageRect, NSCompositingOperationSourceAtop);
    [self.dvdLogo unlockFocus];
}

- (void)animateOneFrame
{
    //[self setNeedsDisplay:true];
    [self setNeedsDisplayInRect:self.dirtyRect];
    return;
}



- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
