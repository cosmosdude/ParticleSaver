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

@interface ParticleHandler : NSObject
@property NSBezierPath * vacinityLine;
@property ParticlePool * pool;
@property NSRect rect;

-(instancetype) init;

-(void) calculateAndDraw;

@end

NS_ASSUME_NONNULL_END
