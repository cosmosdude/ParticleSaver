//
//  THAParticlesView.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

#import "PreferencesHandler.h"
#import "PreferencesWindowController.h"
#import "ParticleView.h"
#import "GradientView.h"

BOOL isPreview = false;

@interface THAParticlesView : ScreenSaverView
{
    NSArray<id> * gradientColors;
    NSArray<id> * whiteColors;
    
    // particle playground view
    ParticleView* contentView;
    
    // backing gradient view layer.
    CAGradientLayer * gradientLayer;
    
    GradientView * gradientView;
    
    // Preferences controller
    PreferencesWindowController * preferences;
    
    NSTextField * giftLabel;
}
@end
