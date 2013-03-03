//
//  NDAFileViewController.m
//  NetDotApp
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAFileViewController.h"


@interface NDAFileViewController ()

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *kindLabel;
@property (nonatomic, strong) IBOutlet UILabel *mimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *typeLabel;
@property (nonatomic, strong) IBOutlet UITextView *annotationsView;

@end


@implementation NDAFileViewController

- (id)initWithFile:(ADNFile *)file
{
    self = [self init];
    if (self) {
        self.file = file;
    }
    return self;
}

- (void)setFile:(ADNFile *)file
{
    if (_file != file) {
        _file = file;
        [self updateViewFromFile];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViewFromFile];
}

- (void)updateViewFromFile
{
    self.title = self.file.name;
    
    self.nameLabel.text = self.file.name;
    self.kindLabel.text = self.file.kind;
    self.mimeLabel.text = self.file.mimeType;
    self.typeLabel.text = self.file.type;
    self.annotationsView.text = [NSString stringWithFormat:@"%@", self.file.externalRepresentation];
}

@end
