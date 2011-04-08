//
//  COMessageController.m
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COMessageController.h"


@implementation COMessageController

- (void)awakeFromNib
{
	[listView setCellSpacing:2.0f];
	[listView setAllowsEmptySelection:YES];
	[listView setAllowsMultipleSelection:YES];	
	[listView reloadData];
}

- (NSUInteger)numberOfRowsInListView: (PXListView*)aListView
{
#pragma unused(aListView)
	return [[self arrangedObjects] count];
}

- (PXListViewCell*)listView:(PXListView*)aListView cellForRow:(NSUInteger)row
{
	COMessageViewCell *cell = (COMessageViewCell*)[aListView dequeueCellWithReusableIdentifier:@"MessageViewCell"];
	
	if(!cell) {
		cell = [COMessageViewCell cellLoadedFromNibNamed:@"MessageViewCell" reusableIdentifier:@"MessageViewCell"];
	}
    
    COMessage *message = [[self arrangedObjects] objectAtIndex:row];
    [[cell objectController] setContent:message];
    	
	return cell;
}

- (CGFloat)listView:(PXListView*)aListView heightOfRow:(NSUInteger)row
{
	return 50;
}

// Change the MessageDetailView

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    [listView reloadData];
}

- (void)listViewSelectionDidChange:(NSNotification*)aNotification {
    PXListView *aListView = [aNotification object];
    NSIndexSet *selectedRows = [aListView selectedRows];
    // select items in arraycontroll
    [self setSelectionIndexes:selectedRows];

}

@end
