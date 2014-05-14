//
//  JGLoginViewController.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGLoginViewController.h"
#import "JGDashboardViewController.h"

#import <Reachability/Reachability.h>

#import "User+Connector.h"
#import "User+Accessor.h"

@interface JGLoginViewController ()

@property (nonatomic, strong) Reachability *reachability;

- (void)presentDashboard;

@end

@implementation JGLoginViewController

objection_initializer(initWithNibName:bundle:, @"JGLoginView");
objection_requires(@"reachability");

@synthesize emailField = _emailField, passwordField = _passwordField;
@synthesize reachability = _reachability;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.passwordField setSecureTextEntry:YES];
}

- (IBAction)didPressedLoginButton:(id)sender
{
    self.user.email = self.emailField.text; //mobile@madeo.cz
    self.user.password = self.passwordField.text; //moncar
    
    if (![self.reachability isReachable] || ![self.user canLogin]) {
        return;
    }
    
    [self.user loginWithParamters:nil contextFactory:self.contextFactory andConnectorBlock:^(NSError *error) {
       
        if (!error) {
            
            BOOL authorized = [self.user authorizeWithFactory:self.contextFactory];
            if (authorized) {
                [self presentDashboard];
            }else{
                [self.user clear];
            }
        }else{
            [self.user clear];
        }
        
    }];
}

- (void)presentDashboard
{
    JGDashboardViewController *dashboardVC = [self.contextFactory getObject:[JGDashboardViewController class]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:dashboardVC];
    
    [self presentToRootWithController:navigationController];
}

@end
