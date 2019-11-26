//
//  Particle.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "Particle.h"

@implementation Particle

-(id) init {
    self = [super init];
    if (self) {
        _ctx = [NSBezierPath new];
        [_ctx setLineWidth: 1];
        minVacinity = 50*50;    // pre-calculated square of minVacinity
        
        if (PreviewToken.isPreview) {
            maxVacinity = 50*50;  // pre-calculated square of maxVacinity
        } else {
            maxVacinity = 150*150;  // pre-calculated square of maxVacinity
        }
        
    }
    return self;
}

-(BOOL) isInVacinityOf: (Particle *) p {
    // Pythagoras triangle sides. c is the hypotenue.
    CGFloat a, b, c;
    
    a = p.center.x - self.center.x;
    b = p.center.y - self.center.y;
    
    a = a*a;
    b = b*b;
    c = a + b;
    
    return c <= maxVacinity;
}

-(void) markVacinityLineTo: (Particle *) p usingLine: (NSBezierPath *)line {
    
    CGFloat a, b, c;
    
    a = p.center.x - self.center.x;
    b = p.center.y - self.center.y;
    
    a = a*a;
    b = b*b;
    c = a + b;
    
    if (c <= maxVacinity) {
        [line moveToPoint:_center];
        [line lineToPoint:p.center];
        
//        CGFloat total = maxVacinity - minVacinity;
        CGFloat current = c / maxVacinity;
//        current -= 0.5;
        if (current < 0) current = 0;
        
        current = 1-current;
//        // at lest 0.25 is assured.
//        current = (current * 0.75);
        
        [[NSColor colorWithWhite:0.5 alpha:current] setStroke];
        
        if (PreviewToken.isPreview) {
            [line setLineWidth: current * 1];
        } else {
            [line setLineWidth: current * 2];
        }
        
        
//        [[NSColor whiteColor] setStroke];
        [line stroke];
        [line removeAllPoints];
    }
    
    
    
    
}

-(void) draw {
    // draw self here.
    
//    [_ctx moveToPoint: (NSPoint){_center.x + .5, _center.y + .5}];
//    [_ctx lineToPoint: (NSPoint){_center.x - .5, _center.y - .5} ];
//
//    [[NSColor whiteColor] setStroke];
//
//    [_ctx stroke];
//    [_ctx moveToPoint:_center];
//    [_ctx appendBezierPathWithArcWithCenter:_center
//                                     radius: _size.width / 2
//                                 startAngle:0
//                                   endAngle:-M_PI * 2];
    
    CGPoint p = _center;
    p.x -= _size.width / 2;
    p.y -= _size.height / 2;
    [_ctx appendBezierPathWithOvalInRect:(NSRect) {p, _size}];
    
    [NSColor.whiteColor setFill];
    [_ctx fill];
    
    // remove all points after drawing.
    [_ctx removeAllPoints];
}

@end
