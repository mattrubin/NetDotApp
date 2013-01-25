//
//  NDAStreamViewController.h
//  NetDotApp
//
//  Created by Me on 1/25/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDAStreamDataSource.h"


@interface NDAStreamViewController : UITableViewController <NDAStreamDataSourceDelegate>

@property (nonatomic, strong) NDAStreamDataSource *dataSource;

@end
