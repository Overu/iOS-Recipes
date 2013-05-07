/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "TwoToneTableViewController.h"
#import "PRPTwoToneTableView.h"
#import "PRPGradientView.h"

@implementation TwoToneTableViewController

- (UIColor *)tableBackgroundColor {
    return [UIColor colorWithWhite:1.0 alpha:1.0];
}

- (UIColor *)tableTopColor {
    return [UIColor colorWithWhite:0.9 alpha:1.0];
}

- (void)loadView {
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    PRPTwoToneTableView *tv = [[PRPTwoToneTableView alloc] initWithFrame:appFrame style:UITableViewStylePlain];
    self.view = self.tableView = tv;
    [tv release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.navigationItem.title = @"Two Tone";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [self tableBackgroundColor];
    
    // tableView property is a UITableView *
    // Ensure the table can respond to topColor before setting it
    SEL setTopColorSel = @selector(setTopColor:);
    if ([self.tableView respondsToSelector:setTopColorSel]) {
        [self.tableView performSelector:setTopColorSel withObject:[self tableTopColor]];
    }
    
    SEL setBottomColorSel = @selector(setBottomColor:);
    if ([self.tableView respondsToSelector:setBottomColorSel]) {
        [self.tableView performSelector:setBottomColorSel withObject:[UIColor redColor]];        
    }
    
    CGRect headerFrame = CGRectMake(0, 0, self.tableView.frame.size.width, 50.0);
    PRPGradientView *header = [[PRPGradientView alloc] initWithFrame:headerFrame];
    [header setGradientColors:[NSArray arrayWithObjects:(id)[[self tableTopColor] CGColor],
                               (id)[[self tableBackgroundColor] CGColor], nil]];
    self.tableView.tableHeaderView = header;
    [header release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row + 1];
    return cell;
}

@end