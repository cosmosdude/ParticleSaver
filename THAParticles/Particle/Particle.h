//
//  Particle.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

@import Foundation;
@import Cocoa;

#import "PreviewToken.h"

NS_ASSUME_NONNULL_BEGIN

@interface Particle : NSObject
{
    CGFloat minVacinity;
    CGFloat maxVacinity;
}

@property NSBezierPath* ctx;

@property NSPoint center;
@property NSSize size;

@property CGFloat vX;
@property CGFloat vY;


-(id) init;
-(BOOL) isInVacinityOf: (Particle *) p;
-(void) markVacinityLineTo: (Particle *)p usingLine: (NSBezierPath *)line;
-(void) draw;

@end

NS_ASSUME_NONNULL_END
