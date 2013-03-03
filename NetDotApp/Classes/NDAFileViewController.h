//
//  NDAFileViewController.h
//  NetDotApp
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NDAFileViewController : UIViewController

@property (nonatomic, retain) ADNFile *file;

- (id)initWithFile:(ADNFile *)file;

@end
