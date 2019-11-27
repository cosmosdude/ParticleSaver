//
//  GradientView.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//



#import <Cocoa/Cocoa.h>
@import QuartzCore;

//////////////////////////////
/// This class is not used ///
//////////////////////////////

NS_ASSUME_NONNULL_BEGIN

@interface GradientView : NSView

@property CAGradientLayer * gradientLayer;

-(void) setColors:(NSArray*) colors;
-(void) setStartingPoint: (CGPoint) p;
-(void) setEndPoint: (CGPoint) p;

@end

NS_ASSUME_NONNULL_END
