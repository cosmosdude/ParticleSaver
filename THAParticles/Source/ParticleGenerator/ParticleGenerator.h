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

@interface ParticleGenerator : NSObject

+ (Particle *) generateParticleWithinRect: (NSRect) rect;
+ (CGFloat) generateVelocity;
@end

NS_ASSUME_NONNULL_END
