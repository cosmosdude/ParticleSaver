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
    // make self backing layer as gradient
    gradientLayer = [[CAGradientLayer alloc] init];
    return gradientLayer;
}

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        // check if the saver is in preview mode.
        // if the rectangle is the same as screen rectangle, it's not preview.
        // otherwise, it's preview.
        PreviewToken.isPreview = (NSScreen.mainScreen.frame.size.width != frame.size.width);
        
        // set self to use layer.
        [self setWantsLayer:YES];
        
        // make particle view.
        contentView = [[ParticleView alloc] initWithFrame:frame isPreview:isPreview];
        // make the particle view also use layer.
        [contentView setWantsLayer: YES];
        
        // make particle view as mask.
        self.layer.mask = contentView.layer;
        
        // draw beautiful gradients.
        [gradientLayer setColors:@[
            (id)[[NSColor systemBlueColor] CGColor],
            (id)[[NSColor systemIndigoColor] CGColor],
            (id)[[NSColor systemPinkColor] CGColor],
            (id)[[NSColor systemPurpleColor] CGColor],
            (id)[[NSColor systemRedColor] CGColor]
        ]];
        
        // make gradient start at lower-left
        [gradientLayer setStartPoint:(CGPoint){0, 0}];
        // make gradient stop at lower-right
        [gradientLayer setEndPoint:(CGPoint){1, 1}];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    // tell the particle view that the animation has started.
    [contentView startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
    // tell the particle view that the animation has stopped.
    [contentView stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    // does nothing.
}

- (void)animateOneFrame
{
    // tell the particle view to draw one frame.
    [contentView animateOneFrame];
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
