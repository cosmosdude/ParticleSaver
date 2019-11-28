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
        
        // make gradient view
        gradientView = [GradientView new];
        // and make it to use layer.
        gradientView.wantsLayer = YES;
        
        [self addSubview:gradientView];
        
        [gradientView setFrame:frame];
        
        gradientColors = @[
            (id)[[NSColor whiteColor] CGColor],
            (id)[[NSColor systemBlueColor] CGColor],
            (id)[[NSColor systemGreenColor] CGColor],
            (id)[[NSColor systemIndigoColor] CGColor],
            (id)[[NSColor systemOrangeColor] CGColor],
            (id)[[NSColor systemPinkColor] CGColor],
            (id)[[NSColor systemPurpleColor] CGColor],
            (id)[[NSColor systemRedColor] CGColor],
            (id)[[NSColor systemTealColor] CGColor],
            (id)[[NSColor systemYellowColor] CGColor],
            (id)[[NSColor whiteColor] CGColor]
        ];
        
        whiteColors = @[
            (id)[[NSColor whiteColor] CGColor],
            (id)[[NSColor whiteColor] CGColor],
            (id)[[NSColor whiteColor] CGColor],
            (id)[[NSColor whiteColor] CGColor]
        ];
        
        
        preferences = [[PreferencesWindowController alloc] init];
        [preferences loadWindow];
        [[preferences window] close];
        
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
        gradientView.layer.mask = contentView.layer;
        
        if (PreferencesHandler.sharedInstance.isBlackAndWhiteTheme) {
            // draw beautiful gradients.
            [gradientView setColors: whiteColors];
        } else {
            // draw beautiful gradients.
            [gradientView setColors: gradientColors];
        }
        
        
        
        // make gradient start at lower-left
        [gradientView setStartingPoint:(CGPoint){0, 0}];
        // make gradient stop at lower-right
        [gradientView setEndPoint:(CGPoint){1, 1}];
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
    return YES;
}

- (NSWindow*)configureSheet
{
    if ([preferences isWindowLoaded] == NO) {
        
    }
    return preferences.window;
}



@end
