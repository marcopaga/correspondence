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
@synthesize owner;

- (id)initFor:(NSString *)objectId andRegisterAt:(id)owningController {
    self = [super initWithWindowNibName:NIB_CUSTOM_ADDRESS];
    if (self) {
        if([owningController conformsToProtocol: @protocol(COOwner)]){
            [owningController registerDependentController: self];    
        }
        [self setValue:owningController forKey: @"owner"];        
        entity = [self loadEntityFor:objectId];
    }

    return self;
}

- (void)dealloc {
    if([owner conformsToProtocol: @protocol(COOwner)]){
        [owner unregisterDependentController: self];    
    }

    [super dealloc];
}

- (IBAction)okButton:(id)sender {
    NSError *error = nil;
    [[COPersistence managedObjectContext] save: &error];
    if(error != nil){
        int alertReturn = NSRunAlertPanel(nil, @"Could not create new entry", @"OK",nil,nil);
        NSLog([error description]);
    } else {
        [owner unregisterHudController: self];
        [self close];
    
    }    
}

- (NSManagedObject *)loadEntityFor:(NSString *)objectId {
    return [[COPersistence managedObjectContext] objectWithID:objectId];
}

@end
