//
//  JGLoginViewController.h
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "JGBaseViewController.h"

@interface JGLoginViewController : JGBaseViewController

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;

- (IBAction)didPressedLoginButton:(id)sender;

@end
