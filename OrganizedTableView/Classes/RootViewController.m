/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "RootViewController.h"
#import "PRPSwitchSettingsCell.h"
#import "PRPBasicSettingsCell.h"

enum PRPTableSections {
    PRPTableSectionFavorites = 0,
    PRPTableSectionAlerts,
    PRPTableNumSections,
};

enum PRPFavoritesRows {
    PRPTableSecFavoritesRowTeam = 0,
    PRPTableSecFavoritesRowColor,
    PRPTableSecFavoritesRowCity,
    PRPTableSecFavoritesNumRows,
};
enum PRPAlertsRows {
    PRPTableSecAlertsRowAlerts = 0,
    PRPTableSecAlertsNumRows,
};

@implementation RootViewController

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return PRPTableNumSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case PRPTableSectionFavorites:
            return PRPTableSecFavoritesNumRows;
        case PRPTableSectionAlerts:
            return PRPTableSecAlertsNumRows;
        default:
            NSLog(@"Unexpected section (%d)", section);
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case PRPTableSectionFavorites:
            cell = [PRPBasicSettingsCell cellForTableView:tableView];
            switch (indexPath.row) {
                case PRPTableSecFavoritesRowTeam:
                    cell.textLabel.text = @"Favorite Team";
                    cell.detailTextLabel.text = @"Mets";
                    break;
                case PRPTableSecFavoritesRowColor:
                    cell.textLabel.text = @"Favorite Color";
                    cell.detailTextLabel.text = @"Blue";
                    break;
                case PRPTableSecFavoritesRowCity:
                    cell.textLabel.text = @"Favorite City";
                    cell.detailTextLabel.text = @"New York";
                    break;
                default:
                    NSAssert1(NO, @"Unexpected row in Favorites section: %d",
                              indexPath.row);
                    break;
            }
            break;
    
        case PRPTableSectionAlerts:
            switch (indexPath.row) {
                case PRPTableSecAlertsRowAlerts: {
                    PRPSwitchSettingsCell *alertCell = 
                        [PRPSwitchSettingsCell cellForTableView:tableView];
                    alertCell.textLabel.text = @"Alerts";
                    alertCell.cellSwitch.on = NO;
                    cell = alertCell;
                }
                    break;
                default:
                    NSAssert1(NO, @"Unexpected row in Alerts section: %d",
                              indexPath.row);
                    break;
            }
            break;
        default:
            NSAssert1(NO, @"Unexpected section (%d)", indexPath.section);
            break;
    }
   
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case PRPTableSectionFavorites:
            switch (indexPath.row) {
                case PRPTableSecFavoritesRowTeam:
                    NSLog(@"Team row selected");
                    break;
                case PRPTableSecFavoritesRowColor:
                    NSLog(@"Color row selected");
                    break;
                case PRPTableSecFavoritesRowCity:
                    NSLog(@"City row selected");
                    break;
                default:
                    NSAssert1(NO, @"Unexpected selection of row %d", indexPath.row);
                    break;            
            }
            break;
        default:
            NSLog(@"Unexpected selection at indexPath %@", indexPath);
            break;
    }
}

@end