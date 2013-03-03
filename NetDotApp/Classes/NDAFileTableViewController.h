//
//  NDAFileTableViewController.h
//  NetDotApp
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDAFileTableDataSource.h"


@interface NDAFileTableViewController : UITableViewController <NDAFileTableDataSourceDelegate>

@property (nonatomic, strong) NDAFileTableDataSource *dataSource;

@end
