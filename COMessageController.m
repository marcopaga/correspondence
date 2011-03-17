//
//  COMessageController.m
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COMessageController.h"


@implementation COMessageController

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
	MessageViewCell *cell = (MessageViewCell*)[aListView dequeueCellWithReusableIdentifier:@"MessageViewCell"];
	
	if(!cell) {
		cell = [MessageViewCell cellLoadedFromNibNamed:@"MessageViewCell" reusableIdentifier:@"MessageViewCell"];
	}
    
    COMessage *message = [[self arrangedObjects] objectAtIndex:row];
    
    // TODO: only set message to cell and let the cell handle the bindings
    [[cell messageController] setContent:message];
    
    NSString *text = [message valueForKey:@"subjectLine"];
	[[cell titleLabel] setStringValue:text];
    
//    NSButton *box = [cell fromMeBox];
    NSImage *image;
    Boolean b = [message fromMe];
    if (b == YES) {
//        [box setState:NSOnState];
        image = [NSImage imageNamed:@"up"];
    } else {
//        [box setState:NSOffState];
        image = [NSImage imageNamed:@"down"];
    }
    [[cell directionImage] setImage:image];
	
	return cell;
}

- (CGFloat)listView:(PXListView*)aListView heightOfRow:(NSUInteger)row
{
	return 50;
}

@end
