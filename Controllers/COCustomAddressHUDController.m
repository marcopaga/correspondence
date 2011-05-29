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

- (id)initWith:(NSString *)objectId {
    self = [super initWithWindowNibName:NIB_CUSTOM_ADDRESS];
    if (self) {
        entity = [self loadEntityFor:objectId];
    }

    return self;
}

- (IBAction)okButton:(id)sender {
    NSError *error = nil;
    [[COPersistence managedObjectContext] save: &error];
    if(error != nil){
        int alertReturn = NSRunAlertPanel(nil, @"Could not create new entry", @"OK",nil,nil);
        NSLog([error description]);
    }
}

- (NSManagedObject *)loadEntityFor:(NSString *)objectId {
    return [[COPersistence managedObjectContext] objectWithID:objectId];
}

@end
