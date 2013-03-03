//
//  NDAStreamViewController.m
//  NetDotApp
//
//  Created by Matt Rubin on 1/25/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAStreamViewController.h"
#import "NDAPostCell.h"


@interface NDAStreamViewController ()

@end


@implementation NDAStreamViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.dataSource = [[NDAStreamDataSource alloc] init];
        [self.tableView registerClass:[NDAPostCell class] forCellReuseIdentifier:@"PostCell"];
        
        self.refreshControl = [[UIRefreshControl alloc] init];
        [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
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


#pragma mark - Data Source

- (void)setDataSource:(NDAStreamDataSource *)dataSource
{
    if (_dataSource != dataSource) {
        _dataSource = dataSource;
        self.tableView.dataSource = dataSource;
        dataSource.delegate = self;
        [dataSource fetchLatest];
    }
}

- (void)refresh
{
    [self.dataSource fetchNewer];
}

- (void)dataSourceDidFinishFetching:(NDAStreamDataSource *)dataSource
{
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (void)dataSource:(NDAStreamDataSource *)dataSource didFinishFetchingWithIndexPaths:(NSArray *)indexPaths
{
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];

    CGPoint offset = self.tableView.contentOffset;
    offset.y -= self.refreshControl.frame.size.height;
    for (NSIndexPath *indexPath in indexPaths) {
        offset.y += [self tableView:self.tableView heightForRowAtIndexPath:indexPath];
    }
    
    [self.tableView setContentOffset:offset animated:NO];
    offset.y += self.refreshControl.frame.size.height;
    [self.tableView setContentOffset:offset animated:YES];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
