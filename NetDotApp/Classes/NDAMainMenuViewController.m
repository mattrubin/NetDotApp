//
//  NDAMainMenuViewController.m
//  NetDotApp
//
//  Created by Matt Rubin on 2/7/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAMainMenuViewController.h"
#import "NDAFileTableViewController.h"


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
                                [NDAMenuItem menuItemWithTitle:@"Lookup"
                                                 nextMenuItems:@[
                                    [NDAMenuItem menuItemWithTitle:@"Retrieve a User"],
                                    [NDAMenuItem menuItemWithTitle:@"Retrieve multiple Users"],
                                    [NDAMenuItem menuItemWithTitle:@"Search for Users"],
                                 ]],
                                [NDAMenuItem menuItemWithTitle:@"Profile"
                                                 nextMenuItems:@[
                                    [NDAMenuItem menuItemWithTitle:@"Update a User"],
                                    [NDAMenuItem menuItemWithTitle:@"Retrieve a User's avatar image"],
                                    [NDAMenuItem menuItemWithTitle:@"Update a User's avatar image"],
                                    [NDAMenuItem menuItemWithTitle:@"Retrieve a User's cover image"],
                                    [NDAMenuItem menuItemWithTitle:@"Update a User's cover image"],
                                 ]],
                                [NDAMenuItem menuItemWithTitle:@"Following"
                                                 nextMenuItems:@[
                                    [NDAMenuItem menuItemWithTitle:@"Follow a User"],
                                    [NDAMenuItem menuItemWithTitle:@"Unfollow a User"],
                                    [NDAMenuItem menuItemWithTitle:@"List users a user is following"],
                                    [NDAMenuItem menuItemWithTitle:@"List users following a user"],
                                    [NDAMenuItem menuItemWithTitle:@"List user ids a User is following"],
                                    [NDAMenuItem menuItemWithTitle:@"List user ids following a user"],
                                 ]],
                                [NDAMenuItem menuItemWithTitle:@"Muting"
                                                 nextMenuItems:@[
                                    [NDAMenuItem menuItemWithTitle:@"Mute a User"],
                                    [NDAMenuItem menuItemWithTitle:@"Unmute a User"],
                                    [NDAMenuItem menuItemWithTitle:@"List muted Users"],
                                    [NDAMenuItem menuItemWithTitle:@"Retrieve muted User IDs for multiple Users"],
                                 ]],
                                [NDAMenuItem menuItemWithTitle:@"Post Interactions"
                                                 nextMenuItems:@[
                                    [NDAMenuItem menuItemWithTitle:@"List Users who have reposted a Post"],
                                    [NDAMenuItem menuItemWithTitle:@"List Users who have starred a Post"],
                                 ]],
                            ]],
                           [NDAMenuItem menuItemWithTitle:@"Post"],
                           [NDAMenuItem menuItemWithTitle:@"Channel"],
                           [NDAMenuItem menuItemWithTitle:@"Message"],
                           [NDAMenuItem menuItemWithTitle:@"File"
                                        nextController:[NDAFileTableViewController class]],
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
