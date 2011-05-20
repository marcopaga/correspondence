//
//  CONotificationHandler.m
//  Correspondence
//
//  Created by Marco Paga on 19.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "CONotificationHandler.h"


@implementation CONotificationHandler

- (id)init
{
    self = [super init];
    if (self) {
        [self registerForAddressBookNotifications];
    }
    
    return self;
}

- (void)dealloc
{
    [self unregisterFromAddressBookNotifications];    
    [super dealloc];
}

- (void)registerForAddressBookNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addressBookChangedNotification:)
                                                 name:kABDatabaseChangedExternallyNotification
                                               object:nil];
    [ABAddressBook sharedAddressBook];
}

- (void)unregisterFromAddressBookNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSString *)nameFromRecord:(ABPerson *)record {
    NSString *firstName = [record valueForProperty:kABFirstNameProperty];
    NSString *lastName = [record valueForProperty:kABLastNameProperty];
    NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    return name;
}

- (void)addressBookChangedNotification:(NSNotification *)notification {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSArray *updatedRecords = [[notification userInfo] objectForKey:kABUpdatedRecords];
        NSArray *deletedRecords = [[notification userInfo] objectForKey:kABDeletedRecords];
        
        for (NSString *each in updatedRecords) {
            NSLog(@"Updated: %@", each);
            [self updateRecord:each];
        }
        
        for (NSString *each in deletedRecords) {
            NSLog(@"Deleted: %@", each);
        }
    });
}

- (void)updateRecord:(NSString *)uniqueId {
    ABRecord *addressBookRecord = [[ABAddressBook sharedAddressBook] recordForUniqueId:uniqueId];
    NSString *newName = [self nameFromRecord:addressBookRecord];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSManagedObject *coPerson = [self findRecordByUniqueId:uniqueId];
        [coPerson setValue:newName forKey:@"name"];
        [[COPersistence managedObjectContext] save:nil];
    });
}

- (NSManagedObject *)findRecordByUniqueId:(NSString *)uniqueId {
    NSManagedObjectContext *moc = [COPersistence managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity:[NSEntityDescription entityForName:ENTITY_ADDRESSBOOK_PERSON inManagedObjectContext:moc]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"uniqueId = %@", uniqueId]];
    
    return [[COPersistence managedObjectContext] executeFetchRequest:fetchRequest error:nil];
}


@end
