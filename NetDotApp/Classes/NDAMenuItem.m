//
//  NDAMenuItem.m
//  NetDotApp
//
//  Created by Matt Rubin on 2/7/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAMenuItem.h"


@implementation NDAMenuItem

- (id)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

+ (instancetype)menuItemWithTitle:(NSString*)title
{
    return [[self alloc] initWithTitle:title];
}

@end
