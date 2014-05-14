//
//  JGBaseViewController.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGBaseViewController.h"
#import "JGAppDelegate.h"

@interface JGBaseViewController ()

@end

@implementation JGBaseViewController

objection_requires(@"user", @"contextFactory");

@synthesize user = _user;
@synthesize contextFactory = _contextFactory;

- (void)presentToRootWithController:(UIViewController*)controller
{
    JGAppDelegate *application = (JGAppDelegate*)[self.contextFactory getObject:@protocol(UIApplicationDelegate)];
    
    
    [controller setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [application.window.rootViewController presentViewController:controller animated:YES
                                                      completion:^{
                                                          
                                                          [controller dismissViewControllerAnimated:NO completion:nil];
                                                          [application.window setRootViewController:controller];
                                                          
                                                          
                                                      }];
}


@end
