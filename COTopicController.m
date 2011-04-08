//
//  COTopicController.m
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COTopicController.h"


@implementation COTopicController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (NSUInteger)numberOfRowsInListView: (PXListView*)aListView
{
#pragma unused(aListView)
	return [[self arrangedObjects] count];
}

- (PXListViewCell*)listView:(PXListView*)aListView cellForRow:(NSUInteger)row
{
	TopicViewCell *cell = (TopicViewCell*)[aListView dequeueCellWithReusableIdentifier:@"TopicViewCell"];
	
	if(!cell) {
		cell = [TopicViewCell cellLoadedFromNibNamed:@"TopicViewCell" reusableIdentifier:@"TopicViewCell"];
	}
    
    NSManagedObject *topic = [[self arrangedObjects] objectAtIndex:row];
    [[cell objectController] setContent:topic];
	
	return cell;
}

- (CGFloat)listView:(PXListView*)aListView heightOfRow:(NSUInteger)row
{
	return 50;
}

// Topics are shown for a selected Receiver
- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    [listView reloadData];
}

- (void)listViewSelectionDidChange:(NSNotification*)aNotification {
    PXListView *aListView = [aNotification object];
    NSIndexSet *selectedRows = [aListView selectedRows];
    [self setSelectionIndexes:selectedRows];
    // TODO RR: Bind message view directly to the topic controller
    [childView reloadData];
}

@end

