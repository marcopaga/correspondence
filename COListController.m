//
//  COListController.m
//  Correspondence
//
//  Created by Robert Retzbach on 16.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COListController.h"


@implementation COListController

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

- (void)addObject:(id)object
{
    [super addObject:object];
    [listView reloadData];
}

- (void)remove:(id)sender
{
    [super remove:sender];
    [listView reloadData];
}

@end
