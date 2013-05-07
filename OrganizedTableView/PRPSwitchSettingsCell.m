/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPSwitchSettingsCell.m
//  OrganizedTableView
//
//  Created by Matt Drance on 7/27/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPSwitchSettingsCell.h"

@implementation PRPSwitchSettingsCell

@synthesize cellSwitch;

- (void)dealloc {
    [cellSwitch release], cellSwitch = nil;
    [super dealloc];
}

- (id)initWithCellIdentifier:(NSString *)cellID {
    if ((self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID])) {
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        cellSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        self.accessoryView = self.cellSwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end