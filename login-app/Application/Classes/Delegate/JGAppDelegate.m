//
//  JGAppDelegate.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGAppDelegate.h"
#import "JGContextModule.h"
#import "JGLoginViewController.h"

#import <RestKit/RestKit.h>
#import <Objection/Objection.h>

@implementation JGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    RKLogConfigureByName("RestKit", RKLogLevelWarning);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    
    JSObjectionInjector *injector = [JSObjection createInjectorWithModules:
                                     [[JGContextModule alloc] init], nil];
    
    [JSObjection setDefaultInjector:injector];
    JGLoginViewController *loginVC = [[JSObjection defaultInjector] getObject:[JGLoginViewController class]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = loginVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
