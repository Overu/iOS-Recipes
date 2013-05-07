/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  FontsTableViewController.m
//  coreText
//
//  Created by Paul Warren on 1/24/11.
//  Copyright 2011 Primitive Dog Software. All rights reserved.
//

#import "FontsTableViewController.h"


@implementation FontsTableViewController

@synthesize attributedFontNames;

#pragma mark -
#pragma mark Attributed String Utility methods


- (NSAttributedString *)illuminatedString:(NSString *)text 
                                     font:(UIFont *)AtFont{
	
    int len = [text length];
    NSMutableAttributedString *mutaString = 
    [[[NSMutableAttributedString alloc] initWithString:text] autorelease];
    [mutaString addAttribute:(NSString *)(kCTForegroundColorAttributeName) 
                       value:(id)[UIColor darkGrayColor].CGColor 
                       range:NSMakeRange(1, len-1)];
    [mutaString addAttribute:(NSString *)(kCTForegroundColorAttributeName) 
                       value:(id)[UIColor redColor].CGColor 
                       range:NSMakeRange(0, 1)];
    CTFontRef ctFont = CTFontCreateWithName((CFStringRef)AtFont.fontName, 
                                            AtFont.pointSize, 
                                            NULL);
    [mutaString addAttribute:(NSString *)(kCTFontAttributeName) 
                       value:(id)ctFont 
                       range:NSMakeRange(0, 1)];
    CTFontRef ctFont2 = CTFontCreateWithName((CFStringRef)AtFont.fontName, 
                                             AtFont.pointSize*0.8,
                                             NULL);
    [mutaString addAttribute:(NSString *)(kCTFontAttributeName) 
                       value:(id)ctFont2 
                       range:NSMakeRange(1, len-1)];
    CFRelease(ctFont);
    CFRelease(ctFont2);
    return [[mutaString copy] autorelease];
}


- (NSAttributedString *)underlinedString:(NSString *)text 
                                     font:(UIFont *)AtFont{
	
    int len = [text length];
    NSMutableAttributedString *mutaString = 
    [[[NSMutableAttributedString alloc] initWithString:text] autorelease];

    CTFontRef ctFont = CTFontCreateWithName((CFStringRef)AtFont.fontName, 
                                            AtFont.pointSize, 
                                            NULL);
    [mutaString addAttribute:(NSString *)(kCTFontAttributeName) 
                       value:(id)ctFont 
                       range:NSMakeRange(0, len)];

    [mutaString addAttribute:(NSString *)(kCTUnderlineStyleAttributeName) 
                       value:[NSNumber numberWithInt:kCTUnderlineStyleSingle]
                       range:NSMakeRange(0, 6)];
    
    CFRelease(ctFont);
    return [[mutaString copy] autorelease];
}

- (NSAttributedString *)multiColoredString:(NSString *)text 
                                      font:(UIFont *)AtFont {
    
	NSArray *colors = [NSArray arrayWithObjects:(id)
                       [UIColor cyanColor].CGColor,
					   [UIColor redColor].CGColor,
					   [UIColor orangeColor].CGColor,
					   [UIColor cyanColor].CGColor,
					   [UIColor greenColor].CGColor,
					   [UIColor redColor].CGColor,
					   nil];
    
	NSMutableAttributedString *mutaString = 
    [[[NSMutableAttributedString alloc] initWithString:text] autorelease];
	
	int colorIndex = 0;
	for (int i = 0; i < [mutaString length]; i++) {
		[mutaString addAttribute:(NSString *)(kCTForegroundColorAttributeName) 
						   value:(id)[colors objectAtIndex:colorIndex] 
						   range:NSMakeRange(i, 1)];
		colorIndex++;
		if (colorIndex == [colors count]) colorIndex = 0;
	}
	
    int len = [text length];
	CTFontRef ctFont = CTFontCreateWithName((CFStringRef)AtFont.fontName, 
                                            AtFont.pointSize,
											NULL);
	[mutaString addAttribute:(NSString *)(kCTFontAttributeName) 
                       value:(id)ctFont 
                       range:NSMakeRange(0, len)];
    
    CFRelease(ctFont);
	return [[mutaString copy] autorelease];	
}

#pragma mark -
#pragma mark Initialization

- (void)viewDidLoad {
    [super viewDidLoad];
    
	NSArray *fontArray = [UIFont familyNames];
    NSMutableArray *allFonts = [NSMutableArray array];
    for (NSString *family in fontArray) {
        [allFonts addObjectsFromArray:[UIFont fontNamesForFamilyName:family]];
    }
    fontArray = [allFonts sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    self.attributedFontNames = [NSMutableArray arrayWithCapacity:[fontArray count]];
    for (NSString *fontName in fontArray) {
        UIFont *thisFont = [UIFont fontWithName:fontName size:26];
        if (thisFont && ![fontName isEqualToString:@"Chalkduster"]) {
            
            if ([fontName length] < 18) {
                [self.attributedFontNames addObject: [self 
                                       illuminatedString:fontName 
                                       font:thisFont]];
            } else {
                [self.attributedFontNames addObject: [self 
                                        underlinedString:fontName 
                                        font:thisFont]];
            }
        }
    }
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [attributedFontNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
            cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = 
                    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                    reuseIdentifier:CellIdentifier] autorelease];
        CGRect frame = CGRectMake(10, 0, self.tableView.frame.size.width, 
                                         self.tableView.rowHeight);
        PRPAttributedLabel *attLabel = 
                                [[PRPAttributedLabel alloc] initWithFrame:frame];
        attLabel.backgroundColor = [UIColor whiteColor];
        attLabel.tag = 999;

        [cell.contentView addSubview:attLabel];
        [attLabel release];
    }
    
    PRPAttributedLabel *attLabel = (id)[cell.contentView viewWithTag:999];
    attLabel.attributedText = 
                        [self.attributedFontNames objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {

	[attributedFontNames release], attributedFontNames = nil;

	[super dealloc];
	
}


@end

