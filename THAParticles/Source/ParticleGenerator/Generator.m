//
//  ParticleGenerator.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "Generator.h"

@implementation Generator


+ (Particle *) generateParticleWithinRect:(NSRect)rect {
    
    Particle * p = [Particle new];
    
    // make random starting point
    p.center = (NSPoint) {
        SSRandomFloatBetween(0, rect.size.width),
        SSRandomFloatBetween(0, rect.size.height)
    };
    
    // if the saver is in preview
    if (PreviewToken.isPreview) {
        // make the particle small
        p.size = (NSSize) {2, 2};
    } else {
        // otherwise, make the particle normal
        p.size = (NSSize) {8, 8};
    }
    
    
    // negative or positive multiplication of x-axis
    float xMul = SSRandomIntBetween(1, 0) ? 1: -1;
    // negative or positive multiplication of y-axis
    float yMul = SSRandomIntBetween(1, 0) ? 1: -1;
    
    CGPoint v;
    
    // assign axis velocities
    v.x = [self generateVelocity] * xMul;
    v.y = [self generateVelocity] * yMul;
    
    p.velocity = v;
    
    return p;
    
}


+ (CGFloat)generateVelocity {
    
    // if the saver is in preview mode,
    // make slow velocities.
    if (PreviewToken.isPreview) {
        return SSRandomFloatBetween(0.1, 0.5);
    } else {
        // otherwise, make slow-fast velocities.
        return SSRandomFloatBetween(0.1, 2);
    }
    
    
}

@end
