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
        // allocate graphics context
        _ctx = [NSBezierPath new];
        // set the line width.
        [_ctx setLineWidth: 1];
        
        // if the saver is in preview mode
        if (PreviewToken.isPreview) {
            // make the link vacinity to lower range
            linkVacinity = 50*50;  // pre-calculated square of line vacinity
        } else {
            // otherwise, make it larger.
            linkVacinity = 150*150;  // pre-calculated square of line of vacinity
        }
        
    }
    return self;
}

-(BOOL) collidesWith: (Particle *) p {
    // Pythagoras triangle sides. c is the hypotenue.
    CGFloat a, b, c;
    
    // calculate a and b sides
    a = p.center.x - self.center.x;
    b = p.center.y - self.center.y;
    
    // make them square
    a = a*a;
    b = b*b;
    // calculate c side
    c = a + b;
    
    // get the ideal radius which is the addition of the radii of the two particles.
    CGFloat r = (p.size.width/2) + (_size.width/2);
    // make it squared.
    r *= r;
    
    // if the distance between their center is less than or equal to the ideal radius,
    // then the two particles collide.
    return c <= r;
}

-(void) markVacinityLineTo: (Particle *) p usingLine: (NSBezierPath *)line {
    
    /// Pythagoras trangle sides.
    CGFloat a, b, c;
    
    // calculate a and b side.
    a = p.center.x - self.center.x;
    b = p.center.y - self.center.y;
    
    // make the squared
    a = a*a;
    b = b*b;

    // calculate c side
    c = a + b;
    
    // if the hypotenue is less than or equal to the link vacinity
    // draw vacinity line
    //
    // vacinity line can be strong or weak according to the distance of the two particle.
    if (c <= linkVacinity) {
        
        // draw link point between two particle
        [line moveToPoint:_center];
        [line lineToPoint:p.center];
        
        // calculate the relative distance between two particles
        CGFloat relativeDistance = c / linkVacinity;

        // clamp the relative distance between 0-1
        relativeDistance = fmin(1, fmax(relativeDistance, 0));
        
        // reverse the relative distance.
        relativeDistance = 1-relativeDistance;
        
        // make strong or weak white color according to the relative value.
        //
        // Max color alpha should be 0.5 because another particle might draw another line to this particle.
        //
        // make the color as stroke value.
        [[NSColor colorWithWhite:1 alpha:relativeDistance * 0.5] setStroke];
        
        // if the saver is in preview mode
        if (PreviewToken.isPreview) {
            // draw small link
            [line setLineWidth: relativeDistance * 1];
        } else {
            // draw large link
            [line setLineWidth: relativeDistance * 2];
        }
        
        
        // actually draw the link
        [line stroke];
        // remove current drawing
        [line removeAllPoints];
    }
    
    
    
    
}

-(void) draw {
    
    if ([[PreferencesHandler sharedInstance] shouldShowCircles] == NO) return;
    
    // retain the center point.
    CGPoint p = _center;
    // start x of the rectangle is the half width minus it's center x.
    p.x -= _size.width / 2;
    // start y of the rectangle is the half height minus it's center y.
    p.y -= _size.height / 2;
    
    // mark circle.
    [_ctx appendBezierPathWithOvalInRect:(NSRect) {p, _size}];
    
    // fill zero alpha
    [NSColor.whiteColor setFill];
    [_ctx fill];
    
    // stroke white color.
    // [NSColor.whiteColor setStroke];
    // [_ctx stroke];
    
    // remove all points after drawing.
    [_ctx removeAllPoints];
}

@end
