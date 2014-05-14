//
//  JGDashboardViewController.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGDashboardViewController.h"
#import "JGLoginViewController.h"
#import "JGFirstTabViewController.h"
#import "JGSecondTabViewController.h"
#import "User+Connector.h"
#import "User+Accessor.h"

@interface JGDashboardViewController () <UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabController;

@end

@implementation JGDashboardViewController

objection_initializer(initWithNibName:bundle:, @"JGDashboardView");

@synthesize tabController = _tabController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered
                                                                    target:self action:@selector(didPressedLogoutButton:)];
    self.navigationItem.rightBarButtonItem = logoutButton;
    self.navigationItem.title = [self.user fullName];
    
    _tabController = [self.contextFactory getObject:[UITabBarController class]];
    
    
    JGFirstTabViewController *firstTab = [self.contextFactory getObject:[JGFirstTabViewController class]];
    JGSecondTabViewController *secondTab = [self.contextFactory getObject:[JGSecondTabViewController class]];
    
   
    self.tabController.viewControllers = @[firstTab, secondTab];
    self.tabController.delegate = self;
    
    [self.tabController.view setFrame:self.view.bounds];
    [self addChildViewController:self.tabController];
    [self.view addSubview:self.tabController.view];
    [self.tabController didMoveToParentViewController:self];
    
    [self.tabController.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        
        item.title = [NSString stringWithFormat:@"Tab %d", idx+1];
    }];
}

- (void)didPressedLogoutButton:(id)sender
{
    [self.user logoutWithParamters:nil contextFactory:self.contextFactory andConnectorBlock:^(NSError *error) {
        
        if (!error) {
            
            BOOL deauthorized = [self.user deauthorizeWithFactory:self.contextFactory];
            if (deauthorized) {
                [self presentLogin];
            }
            
        }
        
    }];
}

- (void)presentLogin
{
    [self.user clear];
    
    JGLoginViewController *loginVC = [self.contextFactory getObject:[JGLoginViewController class]];
    [self presentToRootWithController:loginVC];
}

- (void)dealloc
{
    self.tabController.delegate = nil;
}

@end
