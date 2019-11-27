//
//  ParticleView.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "Particle.h"
#import "ParticleGenerator.h"
#import "ParticlePool.h"
#import "ParticleHandler.h"
#import "GradientView.h"
#import "PreviewToken.h"

NS_ASSUME_NONNULL_BEGIN

@interface ParticleView : NSView

{
    ParticlePool * pool;
    ParticleHandler * handler;
    NSColor * bgColor;
    
    BOOL isAnimating;
}

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview;
-(void) startAnimation;
-(void) animateOneFrame;
-(void) stopAnimation;

@end

NS_ASSUME_NONNULL_END
