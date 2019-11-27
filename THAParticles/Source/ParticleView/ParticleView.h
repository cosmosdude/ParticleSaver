//
//  ParticleView.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "Particle.h"
#import "Generator.h"
#import "ParticlePool.h"
#import "ParticleHandler.h"
#import "GradientView.h"
#import "PreviewToken.h"

NS_ASSUME_NONNULL_BEGIN

@interface ParticleView : NSView
{
    // pool of particles
    ParticlePool * pool;
    
    // particle handler
    ParticleHandler * handler;
    
    BOOL isAnimating;
}

/// Instantiate a particle playground view with a specific frame.
///
/// @param frame Initial frame of the playground.
/// @param isPreview Specify whether the playground is intended for preview in settings.
///
- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview;


/// Tells the playground that the animation timer has started.
-(void) startAnimation;

/// Tells the playground that the animation engine want one frame of drawing.
-(void) animateOneFrame;

/// Tells the playground that the animation timer has stopped.
-(void) stopAnimation;

@end

NS_ASSUME_NONNULL_END
