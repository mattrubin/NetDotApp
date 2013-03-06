//
//  NDAUserViewController.m
//  NetDotApp
//
//  Created by Me on 3/6/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAUserViewController.h"


@interface NDAUserViewController ()

@property (nonatomic, strong) UITextView *rawView;

@end


@implementation NDAUserViewController

- (id)initWithUser:(ADNUser *)user
{
    self = [self init];
    if (self) {
        self.user = user;
    }
    return self;
}

- (void)setUser:(ADNUser *)user
{
    if (_user != user) {
        _user = user;
        
        self.title = _user.name;
        self.rawView.text = [_user description];
    }
}


#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rawView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.rawView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.rawView.text = self.user.description;
    
    [self.view addSubview:self.rawView];
}

@end
