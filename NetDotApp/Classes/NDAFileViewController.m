//
//  NDAFileViewController.m
//  NetDotApp
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAFileViewController.h"


@interface NDAFileViewController ()

@end


@implementation NDAFileViewController

- (id)initWithFile:(ADNFile *)file
{
    self = [self init];
    if (self) {
        // Custom initialization
        UIWebView *webView = [[UIWebView alloc] init];
        [webView loadRequest:[NSURLRequest requestWithURL:file.url]];
        self.view = webView;
        self.view.multipleTouchEnabled = YES;
    }
    return self;
}

@end
