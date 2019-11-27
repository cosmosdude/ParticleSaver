//
//  THAParticlesView.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "THAParticlesView.h"

@implementation THAParticlesView

- (CALayer *)makeBackingLayer {
    gradientLayer = [[CAGradientLayer alloc] init];
    return gradientLayer;
}

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        PreviewToken.isPreview = (NSScreen.mainScreen.frame.size.width != frame.size.width);
        
        [self setWantsLayer:YES];
        
        contentView = [[ParticleView alloc] initWithFrame:frame isPreview:isPreview];
        [contentView setWantsLayer: YES];
        
        self.layer.mask = contentView.layer;
        
        
        [gradientLayer setColors:@[
            (id)[[NSColor systemBlueColor] CGColor],
            (id)[[NSColor systemIndigoColor] CGColor],
            (id)[[NSColor systemPinkColor] CGColor],
            (id)[[NSColor systemPurpleColor] CGColor],
            (id)[[NSColor systemRedColor] CGColor]
        ]];
        [gradientLayer setStartPoint:(CGPoint){0, 0}];
        [gradientLayer setEndPoint:(CGPoint){1, 1}];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    
    [contentView startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
    
    [contentView stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    // Draw gradient here
    
//    [gradient drawInRect:rect angle:0];
//    [[NSColor whiteColor] setFill];
    // NSBezierPath * p = [NSBezierPath bezierPathWithRect:rect];
    
    
}

- (void)animateOneFrame
{
    [self setNeedsDisplay: YES];
    [contentView animateOneFrame];
    return;
}

- (BOOL)hasConfigureSheet
{
    return YES;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
