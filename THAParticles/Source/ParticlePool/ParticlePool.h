//
//  ParticlePool.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

@import Foundation;

#import "../Particle/Particle.h"
#import "../ParticleGenerator/ParticleGenerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ParticlePool : NSObject
{
    NSMutableArray<Particle *> * particles;
}

@property int particleLimit;

-(instancetype) init;
-(instancetype) initWithParticleLimit:(int) limit;

-(NSMutableArray*) items;
-(BOOL) isFull;
-(void) fillParticle: (Particle*) item;

@end

NS_ASSUME_NONNULL_END
