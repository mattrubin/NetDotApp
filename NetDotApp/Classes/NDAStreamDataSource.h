//
//  NDAStreamDataSource.h
//  NetDotApp
//
//  Created by Me on 1/25/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NDAStreamDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

- (void)fetch;

@end
