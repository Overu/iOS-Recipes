/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PrintSubviewsViewController.m
//  PrintSubviews
//
//  Created by Matt Drance on 11/18/09.
//  Copyright Bookhouse Software, LLC 2009. All rights reserved.
//
#import "UIView+PRPSubviewTraversal.h"
#import "PrintSubviewsViewController.h"
#import "PRPViews.h"

@implementation PrintSubviewsViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID] autorelease];
    }
    
    cell.textLabel.text = @"Line 1";
    cell.detailTextLabel.text = @"Line 2";
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (IBAction)printView:(id)sender {
    Class labelClass = [UILabel class];
    NSArray *uiLabels = [self.view 
                         prp_subviewsMatchingClass:labelClass];
    Class PRPLabelClass = [PRPLabel class];
    NSArray *prpLabels = [self.view 
                          prp_subviewsMatchingClass:PRPLabelClass];
    NSArray *allLabels = [self.view 
                          prp_subviewsMatchingOrInheritingClass:labelClass];
    Class PRPCustomViewClass = [PRPCustomView class];
    NSArray *customViews = [self.view 
                            prp_subviewsMatchingClass:PRPCustomViewClass];

    NSLog(@"%d UILabels", [uiLabels count]);
    NSLog(@"%d PRPLabels", [prpLabels count]);
    NSLog(@"%d UILabels", [allLabels count]);
    NSLog(@"%d PRPCustomViews", [customViews count]);

    [self.view prp_printSubviews];
}

@end
