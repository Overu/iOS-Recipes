/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  TitleListViewController.m
//  BasicSplashScreen
//
//  Created by Matt Drance on 3/21/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "TitleListViewController.h"
#import "PRPBookInfo.h"
#import "PRPWebViewController.h"

@implementation TitleListViewController

@synthesize books;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [books release], books = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.books = [PRPBookInfo demoBookList];
    self.title = @"Cocoa Titles";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    PRPBookInfo *book = [self.books objectAtIndex:indexPath.row];
    cell.textLabel.text = book.bookTitle;
    cell.detailTextLabel.text = [book.authors componentsJoinedByString:@", "];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PRPBookInfo *book = [self.books objectAtIndex:indexPath.row];
    PRPWebViewController *webVC = [[PRPWebViewController alloc] init];
    webVC.backgroundColor = [UIColor grayColor];
    webVC.url = [NSURL URLWithString:book.URLString];
    webVC.title = book.bookTitle;
    [self.navigationController pushViewController:webVC animated:YES];
    [webVC release];
}

@end
