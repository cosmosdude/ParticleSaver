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
+(BOOL) isPreview;
+(void) setIsPreview:(BOOL) preview;
@end

NS_ASSUME_NONNULL_END
