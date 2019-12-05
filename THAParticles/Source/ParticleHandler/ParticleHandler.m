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
        
        // initialize the vacinity line.
        _vacinityLine = [NSBezierPath new];
        [_vacinityLine setLineCapStyle:NSLineCapStyleRound];
    }
    return self;
}

- (void) calculateAndDraw {
    if (self.pool) {
        
        /*
         [First]
         All of the particles are moved.
         SPEED = O(n)
         
         [Second]
         Each of the particles test collision with all other particles
         and draw line accordingly.
         
         SPEED = O(n^2)
         
         [Third]
         Each particle draw their graphics separately.
         SPEED = O(n)
         
         All calculations are done on one cpu.
         TOTAL_SPEED = O(n^2)
         */
        
        
        for( register int i = 0; i < _pool.items.count; i++) {
            Particle * p = [_pool.items objectAtIndex:i];
            
            // move the particle
            [self moveParticle:p];
            
            if (p.alpha < 1) {
                
                if (PreferencesHandler.sharedInstance.smoothAppearance == PreferencesSmoothAppearanceStyleFadeIn)
                {
                    p.alpha += 0.01;
                } else {
                    p.alpha += 0.1;
                }
            }
            
        }
        
        // loop through particles.
        for( register int i = 0; i < _pool.items.count; i++ ) {
            
            // for each particle
            Particle * p = [_pool.items objectAtIndex:i];
            
            // loop through all other particles
            // and draw path
            for(register int ii = 0; ii < _pool.items.count; ii++) {
                
                // get another particle
                Particle * pp = [_pool.items objectAtIndex:ii];
                
                // of the current particle is not the same
                // with the targeted another particle.
                if (p != pp) {
                    
                    // draw vacinity line using relative distance between them.
                    //
                    // particle
                    [p markVacinityLineTo:pp usingLine:_vacinityLine];
                    
                    
                    /* Particle collision is disabled for a while.
                    
                    // if the two particles collide each other,
                    // reduce their speed.
                    if ([p collidesWith: pp]) {
                        
                        CGPoint v1 = p.velocity;
                        CGPoint v2 = pp.velocity;
                        
                        // reduce both speed of first particle.
                        if ( fabs(v1.x) > 0.25 ) v1.x *= 0.99;
                        if ( fabs(v1.y) > 0.25 ) v1.y *= 0.99;
                        // reduce both speed of second particle.
                        if ( fabs(v2.x) > 0.25 ) v2.x *= 0.99;
                        if ( fabs(v2.y) > 0.25 ) v2.y *= 0.99;
                        
                        p.velocity = v1;
                        pp.velocity = v2;
                    }
                     
                    */
                }
            }
        }
        
        
        // loop through all of the particles.
        for( register int i = 0; i < _pool.items.count; i++) {
            Particle * p = [_pool.items objectAtIndex:i];
            
            // tell the particle to issue draw commands.
            [p draw];
        }
        
        
        
    }
}

- (void) moveParticle: (Particle *) p {
    
    // get the point of the center of particle for further manipulation.
    NSPoint c = p.center;
    c.x += p.velocity.x; // move x
    c.y += p.velocity.y; // move y
    p.center = c; // reassign value.
    
    CGFloat range = 10; // extra bounding box range.
    
    // left, right, top and bottom bounds.
    CGFloat kLBound, kRBound, kTBound, kBBound;
    kLBound = kBBound = -range; // left and bottom edge of the bounding box is the same in value.
    kRBound = (_rect.size.width+range); // right edge of bounding box.
    kTBound = (_rect.size.height+range); // top edge of bounding box.
    
    CGPoint v = p.velocity;
    
    /*
     if the particle is beyound the left [or] right side of the bounding box,
     make them move to the opposite side.
     */
    if (c.x < kLBound) {
        // make the particle move right side.
        v.x = [Generator generateVelocity];
        
    } else if (c.x > kRBound) {
        // make the particle move left side.
        v.x = [Generator generateVelocity] * -1;
    }
    
    /*
    if the particle is beyound the top [or] bottom side of the bounding box,
    make them move to the opposite side.
    */
    if (c.y < kBBound) {
        // make the particle move upward.
        v.y = [Generator generateVelocity];
    } else if (c.y > kTBound ) {
        // make the particle move downward.
        v.y = [Generator generateVelocity] * -1;
    }
    
    p.velocity = v;
}

@end
