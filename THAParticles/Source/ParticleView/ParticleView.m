//
//  ParticleView.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "ParticleView.h"

@implementation ParticleView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame];
    if (self) {
        // [self setAnimationTimeInterval:1/30.0];
        isAnimating = NO;
        
        if (PreviewToken.isPreview) {
            pool = [[ParticlePool alloc] initWithParticleLimit:15];
        } else {
            pool = [[ParticlePool alloc] initWithParticleLimit:75];
        }
        
        handler = [ParticleHandler new];
        handler.pool = pool;
    }
    return self;
}

- (void)startAnimation
{
    // explicit isAnimating property
    isAnimating = YES;
}

- (void)stopAnimation
{
    // explicit isAnimating property set
    isAnimating = NO;
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    handler.rect = rect;
    
    // set background color
    // NSBezierPath * bg = [NSBezierPath bezierPathWithRect: rect];
    // [bgColor setFill];
    // [bg fill];
    
    // only if the view is animating
    if (isAnimating) {
        // make particle
        [pool fillParticle: [ParticleGenerator generateParticleWithinRect:rect] ];
        
        [handler calculateAndDraw];
    }
}

- (void)animateOneFrame
{
    [self setNeedsDisplay: true];
    return;
}

@end
