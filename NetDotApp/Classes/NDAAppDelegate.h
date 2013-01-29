//
//  NDAAppDelegate.h
//  NetDotApp
//
//  Created by Me on 1/24/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDAAuthenticationViewController.h"


@interface NDAAppDelegate : UIResponder <UIApplicationDelegate, NDAAuthenticationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NDAAuthenticationViewController *authController;

@end
