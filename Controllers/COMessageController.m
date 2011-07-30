//
//  COMessageController.m
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COMessageController.h"


@implementation COMessageController

- (void)awakeFromNib {
    [super awakeFromNib];
    nibName = [NSString stringWithString:@"MessageViewCell"];
}

- (NSSortDescriptor *)getDefaultSortDescriptor {
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    return sort;
}

// Change the MessageDetailView

- (void)listViewSelectionDidChange:(NSNotification *)aNotification {
    PXListView *aListView = [aNotification object];
    NSIndexSet *selectedRows = [aListView selectedRows];
    // select items in arraycontroller
    [self setSelectionIndexes:selectedRows];
    
    // redraw parent's selected row to show that it has lost focus
    [[parentView cellForRowAtIndex:[parentView selectedRow]] setNeedsDisplay:YES];
}

- (void)addReplyToMessage:(COMessage *)message {
    COMessage *replyMessage = [[self newObject] autorelease];
    [replyMessage setTopic:[message topic]];
    [replyMessage setParent:message];
    [replyMessage setSubjectLine:[@"Re: " stringByAppendingString:[message subjectLine]]];
    [listView reloadData];
}

@end
