//
//  ParticleHandler.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "ParticleHandler.h"

@implementation ParticleHandler

- (instancetype)init {
    self = [super init];
    if(self) {
        _vacinityLine = [NSBezierPath new];
        [_vacinityLine setLineWidth: 1];
    }
    return self;
}

- (void) calculateAndDraw {
    if (self.pool) {
//        [self drawParticles];
        
        
        
        for( register int i = 0; i < _pool.items.count; i++) {
            Particle * p = [_pool.items objectAtIndex:i];
            
            // move the particle
            [self moveParticle:p];
        }
        
        for( register int i = 0; i < _pool.items.count; i++ ) {
            Particle * p = [_pool.items objectAtIndex:i];
            
            for(int ii = 0; ii < _pool.items.count; ii++) {
                Particle * pp = [_pool.items objectAtIndex:ii];
                if (p != pp) {
//                    if ([p isInVacinityOf:pp]) {
                    [p markVacinityLineTo:pp usingLine:_vacinityLine];
//                    }
                }
            }
        }
        
        for( register int i = 0; i < _pool.items.count; i++) {
            Particle * p = [_pool.items objectAtIndex:i];
            
            // move the particle
            [self moveParticle:p];
            
            // draw the particle
            [p draw];
            
//            [[NSColor whiteColor] setStroke];
//            [_vacinityLine stroke];
//            [_vacinityLine removeAllPoints];
        }
        
        
        
    }
}

- (void) moveParticle: (Particle *) p {
    NSPoint c = p.center;
    c.x += p.vX;
    c.y += p.vY;
    p.center = c;
    
    if (c.x < -100) {
        p.vX = [ParticleGenerator generateVelocity];
    } else if (c.x > (_rect.size.width+100)) {
        p.vX = [ParticleGenerator generateVelocity] * -1;
    }
    
    if (c.y < -100) {
        p.vY = [ParticleGenerator generateVelocity];
    } else if (c.y > (_rect.size.height+100) ) {
        p.vY = [ParticleGenerator generateVelocity] * -1;
    }
}

@end
