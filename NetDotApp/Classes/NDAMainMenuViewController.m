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
        self.title = @"Resources";
        
        self.menuItems = @[[NDAMenuItem menuItemWithTitle:@"User"
                                            nextMenuItems:@[
                            [NDAMenuItem menuItemWithTitle:@"Retrieve a User" nextController:[UITableViewController class]],
                            [NDAMenuItem menuItemWithTitle:@"Update a User"],
                            [NDAMenuItem menuItemWithTitle:@"Retrieve a User's avatar image"],
                            [NDAMenuItem menuItemWithTitle:@"Update a User's avatar image"],
                            [NDAMenuItem menuItemWithTitle:@"Retrieve a User's cover image"],
                            [NDAMenuItem menuItemWithTitle:@"Update a User's cover image"],
                            [NDAMenuItem menuItemWithTitle:@"Follow a User"],
                            [NDAMenuItem menuItemWithTitle:@"Unfollow a User"],
                            [NDAMenuItem menuItemWithTitle:@"Mute a User"],
                            [NDAMenuItem menuItemWithTitle:@"Unmute a User"],
                            ]],
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
