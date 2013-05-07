/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "DemoTableViewController.h"
#import "PRPGradientView.h"

@implementation DemoTableViewController

@synthesize tableMode;

- (UIColor *)demoBackgroundColor {
    return [UIColor colorWithWhite:1.0 alpha:1.0];
}

- (UIColor *)altBackgroundColor {
    return [UIColor colorWithWhite:0.9 alpha:1.0];
}

- (void)installHeader {
    CGRect headerFrame = CGRectMake(0, 0, self.tableView.frame.size.width, 
                                    50.0);
    PRPGradientView *header = [[PRPGradientView alloc] 
                               initWithFrame:headerFrame];
    [header setGradientColors:[NSArray arrayWithObjects:
                               (id)[self altBackgroundColor].CGColor,
                               (id)self.tableView.backgroundColor.CGColor,
                               nil]];
    self.tableView.tableHeaderView = header;
    header.backgroundColor = [self demoBackgroundColor];
    [header release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    switch (self.tableMode) {
        case PRPTableModeBackgroundOnly:
            self.tableView.backgroundColor = [self demoBackgroundColor];
            break;
        case PRPTableModeBackgroundHeader:
            self.tableView.backgroundColor = [self demoBackgroundColor];
            [self installHeader];
            break;
        case PRPTableModeBackgroundHeaderFooter:
            self.tableView.backgroundColor = [self demoBackgroundColor];
            [self installHeader];
            break;
        default:
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
    
    return cell;
}

@end