//
//  COSharedContext.m
//  Correspondence
//
//  Created by Marco Paga on 06.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COSharedContext.h"


@implementation COSharedContext

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

+(NSManagedObjectContext*)sharedObjectContext
{
    return [[[NSApplication sharedApplication] delegate] managedObjectContext];
}
@end
