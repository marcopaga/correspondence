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
            dispatch_async(dispatch_get_main_queue(), ^{
                COAddressbookPerson *receiver = [self findRecordByUniqueId: each];
                if(receiver != nil) {
                    [self convertRecordToCustomEntity: [receiver objectID]];    
                }
            });
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

/*
 Needs to be executed on the main UI thread
 */
- (NSManagedObject *)findRecordByUniqueId:(NSString *)uniqueId {
    NSManagedObjectContext *moc = [COPersistence managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity:[NSEntityDescription
                                     entityForName: ENTITY_ADDRESSBOOK_PERSON
                             inManagedObjectContext: moc]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"uniqueId = %@", uniqueId]];
    
    return [[COPersistence managedObjectContext] executeFetchRequest:fetchRequest error:nil];
}
- (void) scanAddressBookForChanges
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [COPersistence persistentStoreCoordinator];
        NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext new];
        [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
        
        @try {
            [self scanAddressBookForChangesIn: managedObjectContext];
        } @finally {
            [managedObjectContext release];    
        }
    });    
}

- (void) scanAddressBookForChangesIn: (NSManagedObjectContext *) managedObjectContext
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [COPersistence persistentStoreCoordinator];
        NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext new];
        [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
        
        NSEntityDescription *entityDescription = [NSEntityDescription
                                                     entityForName: ENTITY_ADDRESSBOOK_PERSON
                                            inManagedObjectContext: managedObjectContext ];
        NSFetchRequest *request = [[NSFetchRequest new] autorelease];
        [request setEntity: entityDescription];

        NSError *error = nil;
        NSArray *array = [managedObjectContext
                            executeFetchRequest: request
                                          error: &error];
        if (array != nil)
        {
            ABAddressBook *addressBook = [ABAddressBook sharedAddressBook];
            for (COAddressbookPerson *eachPerson in array) {
                NSLog([eachPerson description]);
                NSString *uniqueId = eachPerson.uniqueId;
                ABRecord *foundRecord = [addressBook recordForUniqueId: uniqueId];
                
                if(foundRecord != nil){
                    NSLog(@"Updating the name");                    
                    NSString *desiredName = [self nameFromRecord: foundRecord];
                    if(![eachPerson.name isEqualToString: desiredName ]){
                        [self updateRecord: [eachPerson objectID] toMatch: desiredName];
                    }
                } else {
                    NSLog(@"Converting to COPerson");
                    [self convertRecordToCustomEntity: [eachPerson objectID] ];
                }
                
            }
        }
        else
        {
            NSLog(@"Could not update local database.");
            NSLog([error description]);
        }
    });
}

- (void) updateRecord: (NSString *) objectId toMatch: (NSString *) desiredName
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSManagedObjectContext *managedObjectContext = [COPersistence managedObjectContext];
        COReceiver *receiver = [managedObjectContext objectWithID: objectId];
        receiver.name = desiredName;
        [managedObjectContext save: nil];
    });
}

- (void) convertRecordToCustomEntity: (NSString *) objectId
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSManagedObjectContext *managedObjectContext = [COPersistence managedObjectContext];
        COAddressbookPerson *oldEntity = [managedObjectContext objectWithID: objectId];
        
        COPerson *newEntity = [NSEntityDescription
                               insertNewObjectForEntityForName: ENTITY_PERSON
                                        inManagedObjectContext: managedObjectContext];
        newEntity.name = oldEntity.name;
        newEntity.topics = oldEntity.topics;
        
        for (NSManagedObject* eachTopic in newEntity.topics) {
            [oldEntity removeTopicsObject: eachTopic];
            [eachTopic setValue: newEntity forKey:@"person"];
        }
        
        [managedObjectContext deleteObject:oldEntity];
        
        [managedObjectContext save:nil];

    });    
}

@end
