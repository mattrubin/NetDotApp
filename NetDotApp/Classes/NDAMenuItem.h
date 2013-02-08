//
//  NDAMenuItem.h
//  NetDotApp
//
//  Created by Matt Rubin on 2/7/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NDAMenuItem : NSObject

@property (nonatomic, copy) NSString *title;

- (id)initWithTitle:(NSString *)title;
+ (instancetype)menuItemWithTitle:(NSString*)title;

@end
