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
        // initially set the isAnimating property to NO.
        isAnimating = NO;
        
        // if it is preview
        if (PreviewToken.isPreview) {
            
            // make a small pool of particles for fitting inside a small draw area.
            pool = [[ParticlePool alloc] initWithParticleLimit:15];
        } else {
            
            int particleMultiplier = (int)PreferencesHandler.sharedInstance.particleCount + 1;
            // otherwise, make a large pool of particles for fitting inside a large screen.
            pool = [[ParticlePool alloc] initWithParticleLimit:particleMultiplier * 25];
        }
        
        // make handle
        handler = [ParticleHandler new];
        // and give it a target pool of particles.
        handler.pool = pool;
    }
    return self;
}

- (void)startAnimation
{
    // explicit isAnimating property set to YES
    isAnimating = YES;
}

- (void)stopAnimation
{
    // explicit isAnimating property set to NO
    isAnimating = NO;
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect]; // this usually does nothing
    
    // let handler retain current drawing parameter
    handler.rect = rect;
    
    // only if the view is animating
    if (isAnimating) {
        
        // make particle and add it to the particle pool.
        // even though particle pool can automatically stop retaining given particle
        // isFull is tested to optimize object allocations.
        if ([pool isFull] == NO) {
            
            // make a particle from random particle generator and add it to the pool.
            [pool fillParticle: [Generator generateParticleWithinRect:rect]];
        }
        
        // tell the handle to calculate and draw particles.
        [handler calculateAndDraw];
    }
}

- (void)animateOneFrame
{
    [self setNeedsDisplay: true];
    return;
}

@end
