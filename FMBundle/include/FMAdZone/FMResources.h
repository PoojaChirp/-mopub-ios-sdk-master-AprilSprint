//
//  FMResources.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 7/7/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMResources_h
#define FMResources_h

#import <Foundation/Foundation.h>
#import "FMResources.h"
#import "FMLogger.h"

@interface FMResources : NSObject

+ (id)sharedResources;

- (id)init;
- (NSBundle *)getResourceBundle;
- (NSString *)getResourcePath: (NSString *)fileName withExtension: (NSString *)ext;
- (NSString *)getFileContents: (NSString *)filePath;
- (NSString *)getJavascript: (NSString *)fileName;
- (NSString *)getPNG: (NSString *)fileName;
- (NSString *)htmlResourceWithFileName: (NSString *)fileName;
- (NSString *)stripFileExt: (NSString *)fileName;
@end

#endif /* FMResources_h */
