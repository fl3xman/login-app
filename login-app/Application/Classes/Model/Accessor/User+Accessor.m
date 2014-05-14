//
//  User+Accessor.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "User+Accessor.h"

#import <RestKit/Network/RKObjectManager.h>

#define CREDENTIAL_TOKEN_HEADER @"token"

@implementation User (Accessor)

- (BOOL)canLogin
{
    return self.email != nil && self.email.length > 0 && self.password != nil && self.password.length > 0;
}

- (void)clear
{
    self.email = nil;
    self.password = nil;
    self.firstName = nil;
    self.lastName = nil;
    self.authenticationToken = nil;
}

- (BOOL)authorizeWithFactory:(JSObjectFactory*)factory
{
    BOOL success = [self hasAuthenticationToken];
    if ( success ) {
        
        RKObjectManager *objectManager = [factory getObject:[RKObjectManager class]];
        [objectManager.HTTPClient setDefaultHeader:CREDENTIAL_TOKEN_HEADER value:self.authenticationToken];
    }
    
    return success;
}

- (BOOL)deauthorizeWithFactory:(JSObjectFactory*)factory;
{
    BOOL success = [self hasAuthenticationToken];
    if ( success ) {
        
        RKObjectManager *objectManager = [factory getObject:[RKObjectManager class]];
        [objectManager.HTTPClient setDefaultHeader:CREDENTIAL_TOKEN_HEADER value:nil];
    }
    
    return success;
}

- (BOOL)hasAuthenticationToken
{
    return (self.authenticationToken != nil && [self.authenticationToken length] > 0);
}

- (NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
