//
//  COListView.m
//  Correspondence
//
//  Created by Robert Retzbach on 16.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COListView.h"


@implementation COListView

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

- (void)reloadData
{
    [super reloadData];
    [self setSelectedRow:0];
}

@end
