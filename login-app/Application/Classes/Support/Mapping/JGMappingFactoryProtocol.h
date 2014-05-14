//
//  JGMappingFactoryProtocol.h
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@protocol JGMappingFactoryProtocol <NSObject>

@optional
+ (NSDictionary*)attributeFromDictionary;
+ (NSArray*)attributeFromArray;

+ (RKObjectMapping*)attributeMapping;
+ (RKRequestDescriptor*)requestWithRequestMethod:(RKRequestMethod)method atKeyPath:(NSString*)path;
+ (RKResponseDescriptor*)responseObjectInPatternPath:(NSString*)patternPath withRequestMethod:(RKRequestMethod)method atKeyPath:(NSString*)path;

@end
