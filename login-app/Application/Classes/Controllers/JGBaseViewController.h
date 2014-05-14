//
//  JGBaseViewController.h
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Objection/Objection.h>

#import "User.h"

@interface JGBaseViewController : UIViewController

@property (nonatomic, strong) JSObjectFactory *contextFactory;
@property (nonatomic, strong) User *user;

- (void)presentToRootWithController:(UIViewController*)controller;

@end
