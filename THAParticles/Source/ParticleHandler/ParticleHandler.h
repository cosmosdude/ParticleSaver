//
//  ParticleHandler.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

@import Foundation;

#import "../Particle/Particle.h"
#import "../ParticlePool/ParticlePool.h"

NS_ASSUME_NONNULL_BEGIN


/// Handler that handle calculations for a pool of particles.
@interface ParticleHandler : NSObject

/// Bezier Path object that is used to draw connection lines between the particles.
@property NSBezierPath * vacinityLine;

/// A pool of particle that control the limit of how much particle will reside.
@property ParticlePool * pool;

/// Retained graphics playground rectangle.
@property NSRect rect;

/// Initialize a particle handler with default values.
-(instancetype) init;

/// Tell the handler to perform calculations on each particles and draw corresponding graphics using them.
///
/// The handler assume the issue is for one frame.
-(void) calculateAndDraw;

@end

NS_ASSUME_NONNULL_END
