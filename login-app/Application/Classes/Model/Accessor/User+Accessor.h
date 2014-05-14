//
//  User+Accessor.h
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "User.h"

@interface User (Accessor)

- (BOOL)canLogin;
- (void)clear;
- (BOOL)authorizeWithFactory:(JSObjectFactory*)factory;
- (BOOL)deauthorizeWithFactory:(JSObjectFactory*)factory;
- (BOOL)hasAuthenticationToken;

- (NSString*)fullName;

@end
