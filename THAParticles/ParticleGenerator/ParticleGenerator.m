//
//  ParticleGenerator.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "ParticleGenerator.h"

@implementation ParticleGenerator


+ (Particle *) generateParticleWithinRect:(NSRect)rect {
    
    Particle * p = [Particle new];
    
    p.center = (NSPoint) {
        SSRandomFloatBetween(0, rect.size.width),
        SSRandomFloatBetween(0, rect.size.height)
    };
    
    if (PreviewToken.isPreview) {
        p.size = (NSSize) {2, 2};
    } else {
        p.size = (NSSize) {5, 5};
    }
    
    
    
    float xMul = SSRandomIntBetween(1, 0) ? 1: -1;
    float yMul = SSRandomIntBetween(1, 0) ? 1: -1;
    
    p.vX = [self generateVelocity] * xMul;
    p.vY = [self generateVelocity] * yMul;
    return p;
    
}


+ (CGFloat)generateVelocity {
    
    if (PreviewToken.isPreview) {
        return SSRandomFloatBetween(0.25, 0.5);
    } else {
        return SSRandomFloatBetween(0.25, 2);
    }
    
    
}

@end
