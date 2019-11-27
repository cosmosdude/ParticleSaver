//
//  ParticlePool.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "ParticlePool.h"

@implementation ParticlePool


-(instancetype) init {
    self = [super init];
    if(self) {
        particles = [NSMutableArray new];
        _particleLimit = 50;
    }
    return self;
}

-(instancetype) initWithParticleLimit:(int) limit {
    self = [super init];
    if(self) {
        particles = [NSMutableArray new];
        _particleLimit = limit;
    }
    return self;
}

- (NSMutableArray *)items {
    return particles;
}

-(BOOL) isFull {
    return ([particles count] >= _particleLimit);
}
-(void) fillParticle: (Particle*) item {
    
    // if the particle pool is not filled yet.
    if ([self isFull] == NO) {
        // fill or insert particle.
        [particles addObject: item];
    }
}

@end
