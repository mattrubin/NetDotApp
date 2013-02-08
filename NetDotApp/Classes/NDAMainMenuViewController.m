//
//  NDAMainMenuViewController.m
//  NetDotApp
//
//  Created by Matt Rubin on 2/7/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAMainMenuViewController.h"


@interface NDAMainMenuViewController ()

@end


@implementation NDAMainMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.menuItems = @[[NDAMenuItem menuItemWithTitle:@"User"],
                           [NDAMenuItem menuItemWithTitle:@"Post"],
                           [NDAMenuItem menuItemWithTitle:@"Channel"],
                           [NDAMenuItem menuItemWithTitle:@"Message"],
                           [NDAMenuItem menuItemWithTitle:@"File"],
                           [NDAMenuItem menuItemWithTitle:@"Stream"],
                           [NDAMenuItem menuItemWithTitle:@"Filter"],
                           [NDAMenuItem menuItemWithTitle:@"Interaction"],
                           [NDAMenuItem menuItemWithTitle:@"Stream Marker"],
                           [NDAMenuItem menuItemWithTitle:@"Text Processor"],
                           [NDAMenuItem menuItemWithTitle:@"Token"],
                           [NDAMenuItem menuItemWithTitle:@"Place"],
                           ];
    }
    return self;
}

@end
