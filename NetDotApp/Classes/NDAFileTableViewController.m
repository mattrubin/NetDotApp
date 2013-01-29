//
//  NDAFileTableViewController.m
//  NetDotApp
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAFileTableViewController.h"
#import "NDAFileCell.h"


@interface NDAFileTableViewController ()

@end


@implementation NDAFileTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.dataSource = [[NDAFileTableDataSource alloc] init];
        [self.tableView registerClass:[NDAFileCell class] forCellReuseIdentifier:@"FileCell"];
        
        self.refreshControl = [[UIRefreshControl alloc] init];
        [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}


#pragma mark - Data Source

- (void)setDataSource:(NDAFileTableDataSource *)dataSource
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

- (void)dataSourceDidFinishFetching:(NDAFileTableDataSource *)dataSource
{
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (void)dataSource:(NDAFileTableDataSource *)dataSource didFinishFetchingWithIndexPaths:(NSArray *)indexPaths
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

@end
