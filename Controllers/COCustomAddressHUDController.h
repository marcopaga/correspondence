//
//  COCustomAddressWindowController.h
//  Correspondence
//
//  Created by Marco Paga on 20.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "COConstants.h"
#import "COPersistence.h"
#import "COPeopleController.h"
#import "COPerson.h"
#import "COCustomAddressHUDController.h"
#import "COOwner.h"

@interface COCustomAddressHUDController : NSWindowController {

    COPerson *entity;
    id owner;
}

@property(retain) NSManagedObject *entity;
@property(retain) id owner;

- (id)initFor:(NSString *)objectId andRegisterAt:(id)owner;

- (IBAction)okButton:(id)sender;

- (COPerson *)loadEntityFor:(NSString *)objectId;

@end
