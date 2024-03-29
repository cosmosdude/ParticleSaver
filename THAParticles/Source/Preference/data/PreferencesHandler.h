//
//  PreferencesHandler.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

NS_ASSUME_NONNULL_BEGIN



@interface PreferencesHandler : ScreenSaverDefaults
{
    NSUserDefaults * defaults;
    
    NSString * kPreferencesKeyShouldShowCircles;
    NSString * kPreferencesKeyIsGradientTheme;
    NSString * kPreferencesKeyParticleCount;
    NSString * kPreferencesKeyParticleSpeed;
    NSString * kPreferencesKeySmoothAppearance;
}
@property(nonatomic) BOOL shouldShowCircles;
-(BOOL) getShouldShowCircles;
-(void) setShouldShowCircles:(BOOL)shouldShowCircles;

@property(nonatomic) BOOL isBlackAndWhiteTheme;
-(BOOL) getIsBlackAndWhiteTheme;
-(void) setIsBlackAndWhiteTheme:(BOOL) isGradientTheme;

@property(nonatomic) NSInteger particleCount;
-(BOOL) getParticleCount;
-(void) setParticleCount:(NSInteger)particleCount;

@property(nonatomic) NSInteger particleSpeed;
-(BOOL) getParticleSpeed;
-(void) setParticleSpeed:(NSInteger)particleSpeed;

@property(nonatomic) NSInteger smoothAppearance;
-(NSInteger) getSmoothAppearance;
-(void) setSmoothAppearance:(NSInteger)smoothAppearance;

- (instancetype)init;

+ (instancetype) sharedInstance;
@end

NS_ASSUME_NONNULL_END



typedef NS_ENUM(NSInteger, PreferencesSmoothAppearanceStyle) {
    PreferencesSmoothAppearanceStyleNone = 0,
    PreferencesSmoothAppearanceStyleRandom = 1,
    PreferencesSmoothAppearanceStyleFadeIn = 2,
};
