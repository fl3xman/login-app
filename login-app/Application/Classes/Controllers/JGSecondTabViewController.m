//
//  JGSecondTabViewController.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGSecondTabViewController.h"

@interface JGSecondTabViewController ()

@end

@implementation JGSecondTabViewController

objection_initializer(initWithNibName:bundle:, @"JGSecondTabView");

@synthesize label = _label;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label.text = self.user.lastName;
}


@end
