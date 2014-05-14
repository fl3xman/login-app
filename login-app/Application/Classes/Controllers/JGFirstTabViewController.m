//
//  JGFirstTabViewController.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGFirstTabViewController.h"

@interface JGFirstTabViewController ()

@end

@implementation JGFirstTabViewController

objection_initializer(initWithNibName:bundle:, @"JGFirstTabView");

@synthesize label = _label;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label.text = self.user.firstName;
}


@end
