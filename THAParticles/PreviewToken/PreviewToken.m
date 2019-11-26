//
//  PreviewToken.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "PreviewToken.h"



@implementation PreviewToken

static BOOL preview = false;

+(BOOL) isPreview {
    return preview;
}
+(void) setIsPreview:(BOOL) p {
    preview = p;
}
@end
