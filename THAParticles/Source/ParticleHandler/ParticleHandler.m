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
                    
                    if ([p collidesWith: pp]) {
                        
                        // if both p and pp is slower nor faster together
                        // switch their sides
//                        if ( !((p.vX < 0 && pp.vX < 0) || (p.vX > 0 && pp.vX > 0)) ) {
//                            p.vX *= -1;
//                            pp.vX *= -1;
//                        }
//
//
//                        if (!((p.vY < 0 && pp.vY < 0) || (p.vY > 0 && pp.vY > 0))) {
//                            p.vX *= -1;
//                            pp.vX *= -1;
//                        }
                        
                        if ( fabs(p.vX) > 0.25 ) p.vX *= 0.99;
                        if ( fabs(p.vY) > 0.25 ) p.vY *= 0.99;

                        if ( fabs(pp.vX) > 0.25 ) pp.vX *= 0.99;
                        if ( fabs(pp.vY) > 0.25 ) pp.vY *= 0.99;
                    }
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
    
    CGFloat range = 10;
    
    if (c.x < -range) {
        p.vX = [ParticleGenerator generateVelocity];
    } else if (c.x > (_rect.size.width+range)) {
        p.vX = [ParticleGenerator generateVelocity] * -1;
    }
    
    if (c.y < -range) {
        p.vY = [ParticleGenerator generateVelocity];
    } else if (c.y > (_rect.size.height+range) ) {
        p.vY = [ParticleGenerator generateVelocity] * -1;
    }
}

@end
