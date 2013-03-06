//
//  NDAGetUserController.m
//  NetDotApp
//
//  Created by Me on 3/6/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAGetUserController.h"
#import "NDAUserViewController.h"


@interface NDAGetUserController () <QuickDialogStyleProvider>

@end


@implementation NDAGetUserController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        QRootElement *rootElement = [[QRootElement alloc] init];
        rootElement.grouped = YES;
        
        QSection *section = [[QSection alloc] init];
        
        self.userEntry = [[QEntryElement alloc] initWithTitle:@"User" Value:nil Placeholder:@"ID, @username, or \"me\""];
        [section addElement:self.userEntry];
        
        [rootElement addSection:section];
        
        QSection *parameters = [QSection new];
        self.annotationsElement = [[QBooleanElement alloc] initWithTitle:@"Include Annotations" BoolValue:NO];
        [parameters addElement:self.annotationsElement];
        [rootElement addSection:parameters];
        
        QSection *submitSection = [QSection new];
        self.submitButton = [[QButtonElement alloc] initWithTitle:@"Submit"];
        self.submitButton.controllerAction = @"go";
        [submitSection addElement:self.submitButton];
        [rootElement addSection:submitSection];
        
        self.root = rootElement;
    }
    return self;
}

- (void)cell:(UITableViewCell *)cell willAppearForElement:(QElement *)element atIndexPath:(NSIndexPath *)indexPath
{
    if ([element isKindOfClass:[QEntryElement class]] && [cell isKindOfClass:[QEntryTableViewCell class]]) {
        ((QEntryTableViewCell *)cell).textField.clearButtonMode = UITextFieldViewModeNever;
    }
}

- (void)go
{
    self.submitButton.enabled = NO;
    
    NSDictionary *parameters = @{ADNParameterIncludeAnnotations: @(self.annotationsElement.boolValue)};
    
    [[ADNClient sharedClient] getUser:self.userEntry.textValue
                       withParameters:parameters
                    completionHandler:^(ADNUser *user, ADNMetadata *meta, NSError *error) {
                    if (user) {
                        //NSLog(@"USER: %@", user);
                        UIViewController *userViewController = [[NDAUserViewController alloc] initWithUser:user];
                        [self.navigationController pushViewController:userViewController animated:YES];
                    } else if (meta) {
                        NSLog(@"META: %@", meta);
                        [[[UIAlertView alloc] initWithTitle:@"ADN Error" message:meta.errorMessage delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
                    } else {
                        NSLog(@"ERROR: %@", error);
                        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
                    }
                    
                    self.submitButton.enabled = YES;
                }];
}

@end
