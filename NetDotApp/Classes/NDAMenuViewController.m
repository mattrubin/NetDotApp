//
//  NDAMenuViewController.m
//  NetDotApp
//
//  Created by Matt Rubin on 2/7/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAMenuViewController.h"


@interface NDAMenuViewController ()

@end


@implementation NDAMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (NDAMenuItem *)tableView:(UITableView *)tableView menuItemForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.menuItems[indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NDAMenuItem *menuItem = [self tableView:tableView menuItemForRowAtIndexPath:indexPath];
    cell.textLabel.text = menuItem.title;
    cell.accessoryType = menuItem.nextController||menuItem.nextMenuItems?UITableViewCellAccessoryDisclosureIndicator:UITableViewCellAccessoryNone;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *nextViewController;
    
    NDAMenuItem *menuItem = [self tableView:tableView menuItemForRowAtIndexPath:indexPath];
    if (menuItem.nextController) {
        nextViewController = [[menuItem.nextController alloc] init];
    } else if (menuItem.nextMenuItems) {
        NDAMenuViewController *menuController = [[NDAMenuViewController alloc] init];
        menuController.menuItems = menuItem.nextMenuItems;
        
        nextViewController = menuController;
    };
    
    nextViewController.title = menuItem.title;
    if ([nextViewController isKindOfClass:[QuickDialogController class]]) {
        ((QuickDialogController *)nextViewController).root.title = menuItem.title;
    }
    
    if (nextViewController) {
        [self.navigationController pushViewController:nextViewController animated:YES];
    }
}

@end
