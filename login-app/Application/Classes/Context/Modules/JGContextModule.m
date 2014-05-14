//
//  JGContextModule.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGContextModule.h"

#import "User+Mapping.h"

#import <RestKit/RestKit.h>
#import <Reachability/Reachability.h>
#import <Objection/JSObjectFactory.h>

@implementation JGContextModule

- (void)configure
{
    [self bind:[UIApplication sharedApplication] toClass:[UIApplication class]];
    [self bind:[UIApplication sharedApplication].delegate toProtocol:@protocol(UIApplicationDelegate)];

    [self bindBlock:^id(JSObjectionInjector *context) {
        
        JSObjectFactory *contextFactory = [[JSObjectFactory alloc] initWithInjector:context];
        return contextFactory;
        
    } toClass:[JSObjectFactory class]];
    
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    

    RKObjectManager* objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://office.madeo.cz:4001"]];
    [objectManager setRequestSerializationMIMEType:RKMIMETypeJSON];
    
    RKRequestDescriptor *loginRequestDescriptor = [User requestWithRequestMethod:RKRequestMethodPOST atKeyPath:nil];
    RKResponseDescriptor *loginResponseDescriptor = [User responseObjectInPatternPath:@"/user/login" withRequestMethod:RKRequestMethodPOST atKeyPath:@""];
    RKResponseDescriptor *logoutResponseDescriptor = [User responseObjectInPatternPath:@"/user/logout" withRequestMethod:RKRequestMethodGET atKeyPath:nil];
    
    [objectManager addRequestDescriptor:loginRequestDescriptor];
    [objectManager addResponseDescriptorsFromArray:@[loginResponseDescriptor, logoutResponseDescriptor]];
    
    RKRoute *loginRoute = [RKRoute routeWithClass:[User class] pathPattern:@"/user/login" method:RKRequestMethodPOST];
    
    [objectManager.router.routeSet addRoutes:@[loginRoute]];
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    
    [self bind:objectManager toClass:[RKObjectManager class]];
    [self bind:reachability toClass:[Reachability class]];
    [self bindClass:[User class] inScope:JSObjectionScopeSingleton];
}

@end
