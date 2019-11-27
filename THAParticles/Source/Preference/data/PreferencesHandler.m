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
        NSString * suitName = [NSBundle.mainBundle bundleIdentifier];
        defaults = [ScreenSaverDefaults defaultsForModuleWithName:suitName];
        
        [defaults registerDefaults:@{
            kPreferencesKeyShouldShowCircles: @YES,
            kPreferencesKeyIsGradientTheme: @NO,
        }];
        
        _shouldShowCircles = [defaults boolForKey:kPreferencesKeyShouldShowCircles];
        _isBlackAndWhiteTheme = [defaults boolForKey:kPreferencesKeyIsGradientTheme];
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

@end
