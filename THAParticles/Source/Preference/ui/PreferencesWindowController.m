//
//  PreferencesWindowController.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "PreferencesWindowController.h"

@interface PreferencesWindowController ()

@end

@implementation PreferencesWindowController

- (NSNibName)windowNibName {
    return @"PreferencesWindowController";
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    themeNames = @[@"Gradient", @"Black & White"];
    
    _buttonForShouldShowCircles.state = (PreferencesHandler.sharedInstance.shouldShowCircles == YES) ? NSControlStateValueOn : NSControlStateValueOff;
    
    // Configure theme selection button
    BOOL isBNG = [PreferencesHandler.sharedInstance getIsBlackAndWhiteTheme];
    [_buttonForThemeSelection removeAllItems];
    [_buttonForThemeSelection addItemsWithTitles: themeNames];
    [_buttonForThemeSelection selectItemAtIndex: isBNG];
    [_buttonForThemeSelection setTitle: [themeNames objectAtIndex:isBNG] ];
    
    
    NSArray<NSString *> * smoothAppearanceNames = @[
        @"Sudden",
        @"Single Fade In",
        @"All Fade In"
    ];
    
    NSInteger smoothAppearance = PreferencesHandler.sharedInstance.smoothAppearance;
    [_buttonForShouldSmoothAppearance removeAllItems];
    [_buttonForShouldSmoothAppearance addItemsWithTitles: smoothAppearanceNames];
    [_buttonForShouldSmoothAppearance selectItemAtIndex: smoothAppearanceNames];
    [_buttonForShouldSmoothAppearance setTitle: [smoothAppearanceNames objectAtIndex:smoothAppearance]];
    

    particleLimitNames = @[
        @"Few", // 25
        @"Intermediate", // 50
        @"Many", // 75
        @"Too Many" // 100
    ];
    
    NSInteger particleLimit = PreferencesHandler.sharedInstance.particleCount;
    [_buttonForParticleLimitSelection removeAllItems];
    [_buttonForParticleLimitSelection addItemsWithTitles: particleLimitNames];
    [_buttonForParticleLimitSelection selectItemAtIndex: particleLimit];
    [_buttonForParticleLimitSelection setTitle: [particleLimitNames objectAtIndex:particleLimit]];
    
    
    NSArray<NSString *> * particleSpeedNames = @[
        @"Slowest",
        @"Slower",
        @"Slow",
        @"Normal",
        @"Fast",
        @"Faster",
        @"Fastest"
    ];
    
    NSInteger particleSpeed = PreferencesHandler.sharedInstance.particleSpeed;
    [_buttonForParticleSpeedSelection removeAllItems];
    [_buttonForParticleSpeedSelection addItemsWithTitles: particleSpeedNames];
    [_buttonForParticleSpeedSelection selectItemAtIndex: particleSpeed];
    [_buttonForParticleSpeedSelection setTitle: [particleSpeedNames objectAtIndex:particleSpeed]];
}

- (IBAction) doneWithSender:(id) sender {
    [[self window] endSheet:[self window]];
}

- (IBAction)actionForHideShowCircles:(id)sender {
    NSButton * btn = sender;
    [[PreferencesHandler sharedInstance] setShouldShowCircles: ([btn state] == NSControlStateValueOn)];
}


- (IBAction)actionForSmoothAppearanceSelection:(id)sender {
    NSPopUpButton* btn = sender;
    [[PreferencesHandler sharedInstance] setSmoothAppearance:btn.indexOfSelectedItem];
}

- (IBAction)actionForThemeSelection:(id)sender {
    NSPopUpButton* btn = sender;
    [[PreferencesHandler sharedInstance] setIsBlackAndWhiteTheme:btn.indexOfSelectedItem];
}

- (IBAction)actionForParticleLimitSelection:(id)sender {
    NSPopUpButton* btn = sender;
    [[PreferencesHandler sharedInstance] setParticleCount: btn.indexOfSelectedItem];
}


- (IBAction)actionForParticleSpeedSelection:(id)sender {
    NSPopUpButton* btn = sender;
    [[PreferencesHandler sharedInstance] setParticleSpeed: btn.indexOfSelectedItem];
}

@end
