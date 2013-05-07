/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  TitleListViewController_iPad.m
//  BasicSplashScreen
//
//  Created by Matt Drance on 3/21/11.
//  Copyright 2011 Bookhouse Software LLC. All rights reserved.
//

#import "TitleListViewController_iPad.h"

#import "PRPBookInfo.h"
#import "PRPWebViewController.h"

@implementation TitleListViewController_iPad

@synthesize webVC;

- (void)dealloc {
    [webVC release], webVC = nil;
    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.webVC = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webVC.backgroundColor = [UIColor grayColor];
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PRPBookInfo *book = [self.books objectAtIndex:indexPath.row];
    self.webVC.url = [NSURL URLWithString:book.URLString];
    self.webVC.title = book.bookTitle;
    [self.webVC reload];
}
@end
