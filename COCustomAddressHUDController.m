//
//  COCustomAddressWindowController.m
//  Correspondence
//
//  Created by Marco Paga on 20.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COCustomAddressHUDController.h"


@implementation COCustomAddressHUDController

@synthesize entity;

- (id)initWith: (NSString*) objectId
{
    self = [super initWithWindowNibName: NIB_CUSTOM_ADDRESS];
    if (self) {
        entity = [self loadEntityFor: objectId];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (IBAction)okButton:(id)sender {
    [[COSharedContext sharedObjectContext] save:nil];
}

-(NSManagedObject*)loadEntityFor:(NSString *)objectId{
    return [[COSharedContext sharedObjectContext] objectWithID:objectId];
}

@end
