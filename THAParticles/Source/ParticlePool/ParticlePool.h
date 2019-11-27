//
//  ParticlePool.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

@import Foundation;

#import "../Particle/Particle.h"
#import "../ParticleGenerator/Generator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ParticlePool : NSObject
{
    /// Underlying particle pool
    NSMutableArray<Particle *> * particles;
}

@property int particleLimit;

/// Initialize a particle pool with default particle limit.
///
/// Default particle limit is 50.
-(instancetype) init;

/// Initialize a particle pool with given limit.
///
/// @param limit Particle limit.
-(instancetype) initWithParticleLimit:(int) limit;

/// Underlying particle items.
-(NSMutableArray*) items;

/// Indicate whether the paticle pool is full or available.
/// @return YES if full, NO otherwise.
-(BOOL) isFull;

/// Fill a particle to the particle pool.
/// If the pool is full, given particle is silently rejected.
///
/// @param item A particle to retain.
///
-(void) fillParticle: (Particle*) item;

@end

NS_ASSUME_NONNULL_END
