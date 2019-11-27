//
//  GradientView.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "GradientView.h"

@implementation GradientView

- (CALayer *)makeBackingLayer {
    _gradientLayer = [CAGradientLayer new];
    
    return _gradientLayer;
}

-(void) setColors:(NSArray*) colors {
    [_gradientLayer setColors: colors];
}

-(void) setStartingPoint: (CGPoint) p {
    [_gradientLayer setStartPoint:p];
}
-(void) setEndPoint: (CGPoint) p {
    [_gradientLayer setEndPoint:p];
}

@end
