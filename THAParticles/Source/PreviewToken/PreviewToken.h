//
//  PreviewToken.h
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-26.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PreviewToken : NSObject

/// Indicate whether the screen saver is in preview mode.
+(BOOL) isPreview;
/// setter property of isPreview property.
+(void) setIsPreview:(BOOL) preview;
@end

NS_ASSUME_NONNULL_END
