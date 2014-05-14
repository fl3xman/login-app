//
//  User+Mapping.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "User+Mapping.h"

@implementation User (Mapping)

+ (NSDictionary*)attributeFromDictionary
{
    return @{
             @"first_name": @"firstName",
             @"last_name" : @"lastName",
             @"authentication_token": @"authenticationToken"
             };
}

+ (NSArray*)attributeFromArray
{
    return @[@"email", @"password"];
}

+ (RKObjectMapping*)attributeMapping
{
    RKObjectMapping* mappingUser = [RKObjectMapping mappingForClass:[self class]];
    [mappingUser addAttributeMappingsFromDictionary:[self attributeFromDictionary]];
    [mappingUser addAttributeMappingsFromArray:[self attributeFromArray]];

    return mappingUser;
}

+ (RKRequestDescriptor*)requestWithRequestMethod:(RKRequestMethod)method atKeyPath:(NSString*)path
{
    RKObjectMapping *mapping = [self attributeMapping];
    RKRequestDescriptor *descriptor = [RKRequestDescriptor requestDescriptorWithMapping:[mapping inverseMapping] objectClass:[self class] rootKeyPath:path method:method];
    
    return descriptor;
}

+ (RKResponseDescriptor*)responseObjectInPatternPath:(NSString*)patternPath withRequestMethod:(RKRequestMethod)method atKeyPath:(NSString*)path
{
    RKObjectMapping *mapping = [self attributeMapping];
    RKResponseDescriptor *descriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                    method:method
                                                                               pathPattern:patternPath
                                                                                   keyPath:path
                                                                               statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}


@end
