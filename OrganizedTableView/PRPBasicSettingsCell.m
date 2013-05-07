/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPBasicSettingsCell.m
//  OrganizedTableView
//
//  Created by Matt Drance on 7/27/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPBasicSettingsCell.h"


@implementation PRPBasicSettingsCell

- (id)initWithCellIdentifier:(NSString *)cellID {
    if ((self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID])) {
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

@end