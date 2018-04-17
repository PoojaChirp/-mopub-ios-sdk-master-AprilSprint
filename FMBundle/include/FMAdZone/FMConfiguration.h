//
//  FMConfiguration.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 7/12/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMConfiguration_h
#define FMConfiguration_h

#import <Foundation/Foundation.h>
#import "FMCallback.h"

@interface FMConfiguration : NSObject

+ (id)sharedConfiguration;

@property (strong, nonatomic) NSMutableDictionary *options;

// Create a group with the provided name. Does nothing if
// the group already exists. Safe to call repeatedly on
// the same group name.
- (NSMutableDictionary *)createGroupWithName:(NSString *)keyName;

// Returns the group identified by groupName if it exists. Otherwise
// returns nil.
- (NSMutableDictionary *)groupWithName:(NSString *)groupName;

// Returns group identified by groupName. Will first create if it
// doesn't exist, or otherwise return pre-existing group. Does not
// overwrite existing group if it already exists.
- (NSMutableDictionary *)createOrRetrieveGroupWithName: (NSString *)groupName;


//
- (NSInteger)integerWithKeyName:(NSString *)keyName groupName:(NSString *)groupName defaultValue:(NSInteger)defaultValue;

// 
- (BOOL)boolWithKeyName:(NSString *)keyName groupName:(NSString *)groupName defaultValue:(BOOL)defaultValue;

//
- (int)intWithKeyName:(NSString *)keyName groupName:(NSString *)groupName defaultValue:(int)defaultValue;

//
- (NSString *)stringWithKeyName:(NSString *)keyName groupName:(NSString *)groupName defaultValue:(NSString *)defaultValue;

// String will be stored in the keystore for later use.
- (BOOL)saveString: (NSString *)value keyName:(NSString *)keyName groupName:(NSString *)groupName;

// BOOL will be packaged into an NSNumber and stored in
// the configuration keystore for later use.
- (BOOL)saveBool:(BOOL)value keyName:(NSString *)keyName groupName:(NSString *)groupName;

// Int will be packaged into an NSNumber and stored in
// the configuration keystore for later use.
- (BOOL)saveInt: (int)value keyName:(NSString *)keyName groupName:(NSString *)groupName;

//
- (BOOL)saveInteger: (NSInteger)value keyName:(NSString  *)keyName groupName:(NSString *)groupName;

- (BOOL)saveCallback:(FMCallback *)callback keyName:(NSString  *)keyName groupName:(NSString *)groupName;

- (FMCallback *)callbackWithKeyName:(NSString *)keyName groupName:(NSString *)groupName defaultValue:(FMCallback *)defaultValue;

- (void)clearConfiguration;

// Internal helper that retrieves generic objects to later convert
// into specific return types.
- (id)valueWithKeyName:(NSString *)keyName groupName:(NSString *)groupName;
@end

#endif /* FMConfiguration_h */
