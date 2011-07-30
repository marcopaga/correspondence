//
//  COListController.m
//  Correspondence
//
//  Created by Robert Retzbach on 16.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COListController.h"


@implementation COListController

@synthesize nibName;

- (void)dealloc {
    [nibName dealloc];
    [super dealloc];
}

- (void)awakeFromNib {
    [listView setCellSpacing:2.0f];
    [listView setAllowsEmptySelection:YES];
    [listView setAllowsMultipleSelection:YES];
    [listView reloadData];
    
    NSSortDescriptor *sort = [self getDefaultSortDescriptor];
    if (sort != nil) {
        [self setSortDescriptors:[NSArray arrayWithObject:sort]];  
    }
    
    [super awakeFromNib];  
}

- (NSSortDescriptor *)getDefaultSortDescriptor {
    return nil;
}

- (void)addObject:(id)object {
    [super addObject:object];
    [listView reloadData];
}

- (void)remove:(id)sender {
    [super remove:sender];
    [listView reloadData];
}

- (NSUInteger)numberOfRowsInListView:(PXListView *)aListView {
    return [[self arrangedObjects] count];
}

- (CGFloat)listView:(PXListView *)aListView heightOfRow:(NSUInteger)row {
    return 50;
}

- (PXListViewCell *)listView:(PXListView *)aListView cellForRow:(NSUInteger)row {
    COManagedViewCell *cell = (COManagedViewCell *)[aListView dequeueCellWithReusableIdentifier:nibName];

    if (!cell) {
        cell = [COManagedViewCell cellLoadedFromNibNamed:nibName reusableIdentifier:nibName];
    }

    NSManagedObject *entity = [[self arrangedObjects] objectAtIndex:row];
    [[cell objectController] setContent:entity];

    return cell;
}

@end
