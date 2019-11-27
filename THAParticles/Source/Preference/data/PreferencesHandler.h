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
}
@property(nonatomic) BOOL shouldShowCircles;
-(BOOL) getShouldShowCircles;
-(void) setShouldShowCircles:(BOOL)shouldShowCircles;

@property(nonatomic) BOOL isBlackAndWhiteTheme;
-(BOOL) getIsBlackAndWhiteTheme;
-(void) setIsBlackAndWhiteTheme:(BOOL) isGradientTheme;

- (instancetype)init;

+ (instancetype) sharedInstance;
@end

NS_ASSUME_NONNULL_END
