//
//  NDAMenuItem.m
//  NetDotApp
//
//  Created by Matt Rubin on 2/7/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAMenuItem.h"


@implementation NDAMenuItem

- (void)setNextController:(Class)nextController
{
    NSAssert([nextController isSubclassOfClass:[UIViewController class]],
             @"The next controller must be a subclass of UIViewController");
    if (_nextController != nextController) {
        _nextController = nextController;
    }
}

#pragma mark -

- (id)initWithTitle:(NSString *)title
{
    self = [self init];
    if (self) {
        self.title = title;
    }
    return self;
}

+ (instancetype)menuItemWithTitle:(NSString*)title
{
    return [[self alloc] initWithTitle:title];
}

- (id)initWithTitle:(NSString *)title nextController:(Class)nextController
{
    self = [self init];
    if (self) {
        self.title = title;
        self.nextController = nextController;
    }
    return self;
}

+ (instancetype)menuItemWithTitle:(NSString*)title nextController:(Class)nextController
{
    return [[self alloc] initWithTitle:title nextController:nextController];
}

@end
