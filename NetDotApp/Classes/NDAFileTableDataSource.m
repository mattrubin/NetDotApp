//
//  NDAFileTableDataSource.m
//  NetDotApp
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAFileTableDataSource.h"
#import <AppDotNet/UIImageView+AFNetworking.h>


@interface NDAFileTableDataSource ()

@property (nonatomic, strong) NSMutableArray *files;

@property (nonatomic, copy) NSString *maxId;
@property (nonatomic, copy) NSString *minId;

@end


@implementation NDAFileTableDataSource

- (id)init
{
    self = [super init];
    if (self) {
        self.files = [NSMutableArray array];
    }
    return self;
}


#pragma mark - Fetch

- (void)fetchLatest
{
    [[ADNClient sharedClient] getMyFilesWithParameters:nil
                                     completionHandler:^(NSArray *objects, ADNMetadata *meta, NSError *error)
     {
         NSLog(@"Fetched %i files...", objects.count);
         
         if (objects.count) {
             self.files = [objects mutableCopy];
             
             self.maxId = meta.maxId;
             self.minId = meta.minId;
         } else {
             // Check for error
         }
         
         [self.delegate dataSourceDidFinishFetching:self];
     }];
}

- (void)fetchNewer
{
    NSDictionary *parameters = self.maxId ? @{@"since_id":self.maxId} : nil;
    [[ADNClient sharedClient] getMyFilesWithParameters:parameters
                                     completionHandler:^(NSArray *objects, ADNMetadata *meta, NSError *error)
     {
         NSLog(@"Fetched %i new posts...", objects.count);
         
         if (objects.count) {
             [self.files insertObjects:objects
                             atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, objects.count)]];
             
             self.maxId = meta.maxId;
             
             NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:objects.count];
             for (NSInteger row = 0; row < objects.count; row++) {
                 [indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:0]];
             }
             [self.delegate dataSource:self didFinishFetchingWithIndexPaths:indexPaths];
             
         } else {
             // Check for error
             // If no new posts since since_id, code will still be 200, with 0 objects
             NSLog(@"meta: %@", meta);
             [self.delegate dataSourceDidFinishFetching:self];
         }
     }];
}

- (void)fetchOlder
{
    NSDictionary *parameters = self.minId ? @{@"before_id":self.minId} : nil;
    [[ADNClient sharedClient] getMyFilesWithParameters:parameters
                                     completionHandler:^(NSArray *objects, ADNMetadata *meta, NSError *error)
     {
         NSLog(@"Fetched %i older posts...", objects.count);
         
         if (objects.count) {
             [self.files addObjectsFromArray:objects];
             
             self.minId = meta.minId;
         } else {
             // Check for error
         }
         
         [self.delegate dataSourceDidFinishFetching:self];
     }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Total files: %i", self.files.count);
    return self.files.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PostCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    ADNPost *post = [self.files objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", post.postId, post.user.username];
    cell.detailTextLabel.text = post.text;
    [cell.imageView setImageWithURL:[NSURL URLWithString:post.user.avatarImage.url] placeholderImage:[UIImage imageNamed:@"Default.png"]];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

@end
