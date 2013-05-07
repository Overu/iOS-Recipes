/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  RootViewController.m
//  TwoToneTables
//
//  Created by Matt Drance on 8/4/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "RootViewController.h"
#import "TwoToneTableViewController.h"
#import "DemoTableViewController.h"

enum PRPTableRows {
    PRPRowBackgroundOnly = 0,
    PRPRowBackgroundPlusHeader,
    PRPRowTwoTone,
    PRPRowNumRows,
    PRPRowBackgroundHeaderFooter,
};

@implementation RootViewController

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return PRPRowNumRows;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    switch (indexPath.row) {
        case PRPRowBackgroundOnly:
            cell.textLabel.text = @"Custom background";
            break;
        case PRPRowBackgroundPlusHeader:
            cell.textLabel.text = @"Background + Header";
            break;
        case PRPRowBackgroundHeaderFooter:
            cell.textLabel.text = @"Background + Header + Footer";
            break;
        case PRPRowTwoTone:
            cell.textLabel.text = @"Two-tone table";
            break;
        default:
            NSLog(@"Unexpected table row (%d)", indexPath.row);
            break;
    }
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == PRPRowTwoTone) {
        TwoToneTableViewController *tvc = [[TwoToneTableViewController alloc] init];
        [self.navigationController pushViewController:tvc animated:YES];
        [tvc release];
    } else {
        DemoTableViewController *tvc = [[DemoTableViewController alloc] initWithStyle:UITableViewStylePlain];
        tvc.tableMode = indexPath.row;
        [self.navigationController pushViewController:tvc animated:YES];
        [tvc release];
    }
}
@end

