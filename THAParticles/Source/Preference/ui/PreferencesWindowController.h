//
//  PreferencesWindowController.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "PreferencesHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface PreferencesWindowController : NSWindowController
{
    NSArray<NSString *> * themeNames;
    NSArray<NSString *> * particleLimitNames;
    NSArray<NSString *> * particleSpeedNames;
}


@property IBOutlet NSButton* buttonForShouldShowCircles;

@property IBOutlet NSPopUpButton* buttonForThemeSelection;

@property IBOutlet NSPopUpButton* buttonForParticleLimitSelection;

@property IBOutlet NSPopUpButton* buttonForParticleSpeedSelection;

- (IBAction) doneWithSender:(id) sender;

@end

NS_ASSUME_NONNULL_END
