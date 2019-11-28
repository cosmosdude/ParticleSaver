//
//  PreferencesHandler.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "PreferencesHandler.h"

@implementation PreferencesHandler

- (instancetype)init {
    self = [super init];
    if (self) {
        
        kPreferencesKeyShouldShowCircles = @"shouldShowDots";
        kPreferencesKeyIsGradientTheme = @"isGradientTheme";
        kPreferencesKeyParticleCount = @"particleCount";
        kPreferencesKeyParticleSpeed = @"particleSpeed";
        
        NSString * suitName = [NSBundle.mainBundle bundleIdentifier];
        defaults = [ScreenSaverDefaults defaultsForModuleWithName:suitName];
        
        [defaults registerDefaults:@{
            kPreferencesKeyShouldShowCircles: @YES,
            kPreferencesKeyIsGradientTheme: @NO,
            kPreferencesKeyParticleCount: @1,
            kPreferencesKeyParticleSpeed: @1
        }];
        
        _shouldShowCircles = [defaults boolForKey:kPreferencesKeyShouldShowCircles];
        _isBlackAndWhiteTheme = [defaults boolForKey:kPreferencesKeyIsGradientTheme];
        _particleCount = [defaults integerForKey:kPreferencesKeyParticleCount];
        _particleSpeed = [defaults integerForKey:kPreferencesKeyParticleSpeed];
    }
    return self;
}

+ (instancetype)sharedInstance {
    
    static PreferencesHandler * shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[PreferencesHandler alloc] init];
    });
    
    return shared;
}

-(void) save {
    [defaults synchronize];
}

#pragma mark ShouldShowCircles s&g
-(BOOL) getShouldShowCircles {
    return _shouldShowCircles;
}
-(void) setShouldShowCircles:(BOOL)shouldShowCircles {
    [defaults setBool:shouldShowCircles forKey:kPreferencesKeyShouldShowCircles];
    _shouldShowCircles = shouldShowCircles;
    [self save];
}



#pragma mark IsGradientTheme s&g
-(BOOL) getIsBlackAndWhiteTheme {
    return _isBlackAndWhiteTheme;
}
-(void) setIsBlackAndWhiteTheme:(BOOL)isGradientTheme {
    [defaults setBool:isGradientTheme forKey:kPreferencesKeyIsGradientTheme];
    _isBlackAndWhiteTheme = isGradientTheme;
    [self save];
}

#pragma mark ParticleCount setter
-(BOOL) getParticleCount {
    return _particleCount;
}
- (void)setParticleCount:(NSInteger)particleCount {
    [defaults setInteger:particleCount forKey:kPreferencesKeyParticleCount];
    _particleCount = particleCount;
    [self save];
}

#pragma mark ParticleSpeed s&g
-(BOOL) getParticleSpeed {
    return _particleSpeed;
}
-(void) setParticleSpeed:(NSInteger)particleSpeed {
    [defaults setInteger:particleSpeed forKey:kPreferencesKeyParticleSpeed];
    _particleSpeed = particleSpeed;
    [self save];
}

@end
