//
//  NDAStreamDataSource.h
//  NetDotApp
//
//  Created by Me on 1/25/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@class NDAStreamDataSource;


@protocol NDAStreamDataSourceDelegate <NSObject>

- (void)dataSourceDidFinishFetching:(NDAStreamDataSource *)dataSource;

@end


@interface NDAStreamDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) id <NDAStreamDataSourceDelegate> delegate;

- (void)fetchLatest;
- (void)fetchNewer;
- (void)fetchOlder;

@end
