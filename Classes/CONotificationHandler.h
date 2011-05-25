//
//  CONotificationHandler.h
//  Correspondence
//
//  Created by Marco Paga on 19.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import "COPersistence.h"
#import "COConstants.h"
#import "COPerson.h"
#import "COAddressbookPerson.h"


@interface CONotificationHandler : NSObject {
    
}

- (void)registerForAddressBookNotifications;

- (void)unregisterFromAddressBookNotifications;

- (void)updateRecord:(NSString *)uniqueId;

- (NSManagedObject *)findRecordByUniqueId:(NSString *)uniqueId;

- (NSString *)nameFromRecord:(ABPerson *)person;

- (void) scanAddressBookForChanges;

- (void) scanAddressBookForChangesIn: (NSManagedObjectContext *) managedObjectContext;

- (void) updateRecord: (NSString *) objectId toMatch: (NSString *) desiredName;

- (void) convertRecordToCustomEntity: (NSString *) objectId;

@end
