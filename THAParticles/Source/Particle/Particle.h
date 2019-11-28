//
//  Particle.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

@import Foundation;
@import Cocoa;

#import "PreviewToken.h"
#import "PreferencesHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface Particle : NSObject
{
    // Vacinity for drawing line
    // This value is assumed to be squared.
    CGFloat linkVacinity;
}

/// Graphics context of the particle.
@property NSBezierPath* ctx;

/// Center of the particle
@property NSPoint center;

/// Size of the particle.
@property NSSize size;

/// Velocity of the particle.
@property CGPoint velocity;

/// Alpha of the particle.
@property CGFloat alpha;

/// Initialize a particle with default values.
-(id) init;

/// Test if the particle collide with a given particle.
///
/// @param p Particle to test collision.
///
/// @return YES if the particle collide with the given particle. NO otherwise.
-(BOOL) collidesWith: (Particle *) p;

/// Mark vacinity line to particle if the particle is in vacinity.
/// Line marking is done to given line object.
///
/// @param p    Particle to draw vacinity line.
/// @param line Bezier object to use for drawing.
///
-(void) markVacinityLineTo: (Particle *)p usingLine: (NSBezierPath *)line;

/// Draw particle graphics.
-(void) draw;

@end

NS_ASSUME_NONNULL_END
