/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
#import "NetworkActivityTestViewController.h"
#import "PRPConnection.h"
#import "PRPBookInfo.h"

const CGFloat kTestViewRowHeight = 48.0;

#pragma mark -
#pragma mark Private view controller interface

@interface NetworkActivityTestViewController ()

@property (nonatomic, retain) UIBarButtonItem *startButton;
@property (nonatomic, retain) UIBarButtonItem *stopButton;

- (void)updateCell:(UITableViewCell *)cell withDownload:(PRPConnection *)download;
- (void)updateCellAtIndexPath:(NSIndexPath *)indexPath;
- (void)validateStartStopButton;

@end


#pragma mark -

@implementation NetworkActivityTestViewController

@synthesize books;
@synthesize downloads;

@synthesize startButton;
@synthesize stopButton;

- (void)dealloc {
    [books release], books = nil;
    [downloads release], downloads = nil;
    [startButton release], startButton = nil;
    [stopButton release], stopButton = nil;
    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.startButton = nil;
    self.stopButton = nil;
    [self stopDownloads:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.allowsSelection = NO;
    self.tableView.rowHeight = kTestViewRowHeight;
    
    self.books = [NSArray arrayWithObjects:
                      [PRPBookInfo bookInfoWithTitle:@"Being Productive in Xcode" URL:[NSURL URLWithString:@"http://screencasts.pragprog.com/v-mcxcode-v-sampler.mov"]],
                      [PRPBookInfo bookInfoWithTitle:@"Coding in Objective-C 2.0" URL:[NSURL URLWithString:@"http://screencasts.pragprog.com/v-bdobjc-v-sampler.m4v"]],
                      [PRPBookInfo bookInfoWithTitle:@"Core Animation" URL:[NSURL URLWithString:@"http://screencasts.pragprog.com/v-bdcora-intro.mov"]],
                      [PRPBookInfo bookInfoWithTitle:@"Using Map Kit" URL:[NSURL URLWithString:@"http://screencasts.pragprog.com/v-bdmapkit-preview.mov"]],
                      [PRPBookInfo bookInfoWithTitle:@"Writing Your First iPhone Application" URL:[NSURL URLWithString:@"http://s3.amazonaws.com/screencasts.pragprog.com/v-bdiphone-intro.mov"]],
                      nil];
                                     
    UIBarButtonItem *start = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStylePlain target:self action:@selector(startDownloads:)];
    self.startButton = start;
    [start release];
    
    UIBarButtonItem *stop = [[UIBarButtonItem alloc] initWithTitle:@"Stop" style:UIBarButtonItemStylePlain target:self action:@selector(stopDownloads:)];
    self.stopButton = stop;
    [stop release];
    
    self.navigationItem.rightBarButtonItem = self.startButton;
}

- (void)validateStartStopButton {
    BOOL completed = YES;
    for (PRPConnection *download in self.downloads) {
        if ((download.percentComplete > 0.0) && (download.percentComplete < 100.0)) {
            completed = NO;
            break;
        }
    }
    
    self.navigationItem.rightBarButtonItem = completed ? self.startButton : self.stopButton;
}

#pragma mark
#pragma mark Actions
- (void)startDownloads {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [self.downloads makeObjectsPerformSelector:@selector(start)];
    [[NSRunLoop currentRunLoop] run];
    [pool release];
}

- (IBAction)startDownloads:(id)sender {
    [self.tableView reloadData];
    self.navigationItem.rightBarButtonItem = self.stopButton;
    NSMutableArray *downloadArray = [NSMutableArray arrayWithCapacity:[self.books count]];
    NSUInteger row = 0;
    for (PRPBookInfo *info in self.books) {
        // These blocks may run on a background thread
        // but UI updates must be done on the main thread
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        PRPConnection *download = [PRPConnection connectionWithURL:info.URL 
                                                     progressBlock:^(PRPConnection *connection) {
                                                         [self performSelectorOnMainThread:@selector(updateCellAtIndexPath:) withObject:indexPath waitUntilDone:NO];
                                                    }
                                                   completionBlock:^(PRPConnection *connection, NSError *error) {
                                                       [self performSelectorOnMainThread:@selector(updateCellAtIndexPath:) withObject:indexPath waitUntilDone:NO];
                                                       [self performSelectorOnMainThread:@selector(validateStartStopButton) withObject:nil waitUntilDone:NO];
                                                   }];
        [downloadArray addObject:download];
        row++;
    }
    
    self.downloads = downloadArray;
    [self performSelectorInBackground:@selector(startDownloads) withObject:nil];
}

- (IBAction)stopDownloads:(id)sender {
    self.navigationItem.rightBarButtonItem = self.startButton;
    for (PRPConnection *download in self.downloads) {
        [download stop];
    }
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.books count];
}

 
- (void)updateCell:(UITableViewCell *)cell withDownload:(PRPConnection *)download {
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f%% complete", download.percentComplete];
    [cell.detailTextLabel sizeToFit];
}

- (void)updateCellAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    PRPConnection *download = [self.downloads objectAtIndex:indexPath.row];
    [self updateCell:cell withDownload:download];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSAssert2((indexPath.row < [self.books count]), @"Row %d requested but only %d downloads", indexPath.row, [self.books count]);

    PRPConnection *download = nil;
    if (indexPath.row < [self.downloads count]) {
        download = [self.downloads objectAtIndex:indexPath.row];
    }
    PRPBookInfo *info = [self.books objectAtIndex:indexPath.row];
    cell.textLabel.text = info.title;
    [self updateCell:cell withDownload:download];
    
    return cell;
}

@end