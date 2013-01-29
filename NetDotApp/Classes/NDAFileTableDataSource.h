//
//  NDAFileTableDataSource.h
//  NetDotApp
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@class NDAFileTableDataSource;


@protocol NDAFileTableDataSourceDelegate <NSObject>

- (void)dataSourceDidFinishFetching:(NDAFileTableDataSource *)dataSource;
- (void)dataSource:(NDAFileTableDataSource *)dataSource didFinishFetchingWithIndexPaths:(NSArray *)indexPaths;

@end


@interface NDAFileTableDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) id <NDAFileTableDataSourceDelegate> delegate;

- (void)fetchLatest;
- (void)fetchNewer;
- (void)fetchOlder;

@end
