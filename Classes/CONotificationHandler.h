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


@interface CONotificationHandler : NSObject {
    
}

- (void)registerForAddressBookNotifications;

- (void)unregisterFromAddressBookNotifications;

- (void)updateRecord:(NSString *)uniqueId;

- (NSManagedObject *)findRecordByUniqueId:(NSString *)uniqueId;

- (NSString *)nameFromRecord:(ABPerson *)person;

@end
