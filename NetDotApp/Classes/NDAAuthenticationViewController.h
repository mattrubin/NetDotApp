//
//  NDAAuthenticationViewController.h
//  NetDotApp
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <UIKit/UIKit.h>


extern NSString * const kNDAAuthenticationAccessToken;


@protocol NDAAuthenticationDelegate <NSObject>

- (void)authenticationComplete;

@end


@interface NDAAuthenticationViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, weak) id <NDAAuthenticationDelegate> delegate;

@end
