//
//  NDAUserViewController.h
//  NetDotApp
//
//  Created by Me on 3/6/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NDAUserViewController : UIViewController

@property (nonatomic, strong) ADNUser *user;
- (id)initWithUser:(ADNUser *)user;

@end
