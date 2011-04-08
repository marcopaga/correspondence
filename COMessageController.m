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
    [super awakeFromNib];
    nibName = [NSString stringWithString:@"MessageViewCell"];
}

// Change the MessageDetailView

- (void)listViewSelectionDidChange:(NSNotification*)aNotification {
    PXListView *aListView = [aNotification object];
    NSIndexSet *selectedRows = [aListView selectedRows];
    // select items in arraycontroller
    [self setSelectionIndexes:selectedRows];

}

@end
