//
//  THAParticlesView.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

#import "Particle.h"
#import "Generator.h"
#import "ParticlePool.h"
#import "ParticleHandler.h"
#import "GradientView.h"
#import "PreviewToken.h"

#import "ParticleView.h"

BOOL isPreview = false;

@interface THAParticlesView : ScreenSaverView
{
    // particle playground view
    ParticleView* contentView;
    
    // backing gradient view layer.
    CAGradientLayer * gradientLayer;
}
@end
