//
//  THAParticlesView.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "THAParticlesView.h"

@implementation THAParticlesView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        PreviewToken.isPreview = (NSScreen.mainScreen.frame.size.width != frame.size.width);
        
        
        
        if (PreviewToken.isPreview) {
            pool = [[ParticlePool alloc] initWithParticleLimit:15];
        } else {
            pool = [[ParticlePool alloc] initWithParticleLimit:100];
        }
        
        handler = [ParticleHandler new];
        handler.pool = pool;
        
        bgColor = [NSColor colorWithRed:0x51/0xff green:0x72/0xff blue:0xA7/0xff alpha:1];
        self.layer.backgroundColor = [bgColor CGColor];
        
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    
    
    bgColor = [NSColor blackColor];
    //[NSColor colorWithRed:0x51/0xff green:0x72/0xff blue:0xA7/0xff alpha:1];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
//    if (maskView == nil) {
//        maskView = [GradientView new];
//        maskView.wantsLayer = true;
//         self.layer.mask = maskView.layer;
//        [self addSubview: maskView];
//        maskView.frame = rect;
//        [maskView setColors:@[
//            (id)NSColor.redColor.CGColor// ,
//            (id)NSColor.greenColor.CGColor,
//            (id)NSColor.blueColor.CGColor,
//            (id)NSColor.whiteColor.CGColor
//        ]];
//        [maskView setStartingPoint:(CGPoint){0,0}];
//        [maskView setEndPoint:(CGPoint){1,1}];
//    }
    
    handler.rect = rect;
    
    // set background color
    NSBezierPath * bg = [NSBezierPath bezierPathWithRect: rect];
//    [[NSColor darkGrayColor] setFill];
    // [[NSColor redColor] setFill];
//    [[NSColor clearColor] setFill];
    [bgColor setFill];
    // [[NSColor colorWithRed:0x51/0xff green:0x72/0xff blue:0xA7/0xff alpha:1] setFill];
    [bg fill];
    
    // only if the view is animating
//    if ([self isAnimating]) {
        // make particle
        [pool fillParticle: [ParticleGenerator generateParticleWithinRect:rect] ];
        
        [handler calculateAndDraw];
//    }
}

- (void)animateOneFrame
{
    [self setNeedsDisplay: true];
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
