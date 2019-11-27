//
//  ParticleGenerator.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

@import Foundation;
@import Cocoa;
@import ScreenSaver;

#import "../Particle/Particle.h"
#import "PreviewToken.h"



NS_ASSUME_NONNULL_BEGIN


/// Generator responsible for generating various related values.
@interface Generator : NSObject

/// Generate a particle with given playground parameter.
///
/// @param rect Rectangle of the playground.
///
/// @return A particle of random starting point within rect and random starting velocities.
+ (Particle *) generateParticleWithinRect: (NSRect) rect;

/// Generate a random velocity.
/// If the saver is in preview mode, make slow range velocity.
/// Otherwise, make velocity from slow to fast range.
///
/// @return Random velocity within a specific range.
+ (CGFloat) generateVelocity;
@end

NS_ASSUME_NONNULL_END
