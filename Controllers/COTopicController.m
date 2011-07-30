//
//  COTopicController.m
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COTopicController.h"


@implementation COTopicController

- (void)awakeFromNib {
    [super awakeFromNib];
    nibName = [NSString stringWithString:@"TopicViewCell"];
}

- (NSSortDescriptor *)getDefaultSortDescriptor {
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"lastModified" ascending:NO];
    return sort;
}

- (void)listViewSelectionDidChange:(NSNotification *)aNotification {
    PXListView *aListView = [aNotification object];
    NSIndexSet *selectedRows = [aListView selectedRows];
    [self setSelectionIndexes:selectedRows];
    // TODO RR: Bind message view directly to the topic controller
    [childView reloadData];
}

@end

