//
//  COPeoplePickerController.m
//  Correspondence
//
//  Created by Marco Paga on 09.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COPeoplePickerController.h"


@implementation COPeoplePickerController

#pragma mark Lifecycle

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

#pragma mark Notifications

-(void)registerForAddressBookNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector: @selector(addressBookChangedNotification:)
                                                 name:kABDatabaseChangedExternallyNotification
                                               object:nil];
    [ABAddressBook sharedAddressBook];
}

-(void)unregisterFromAddressBookNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)addressBookChangedNotification:(NSNotification*)notification {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSDictionary* userInfo = [notification userInfo];
        NSArray* updatedRecords = [[notification userInfo] objectForKey:kABUpdatedRecords];
        NSArray* deletedRecords = [[notification userInfo] objectForKey:kABDeletedRecords];
        
        for(NSString* each in updatedRecords){
            NSLog(@"Updated: %@",each);
            [self updateRecord:each];
        }
        
        for(NSString* each in deletedRecords){
            NSLog(@"Deleted: %@",each);
        }
    });
}

-(void)updateRecord:(NSString*)uniqueId
{
    ABRecord* addressBookRecord = [[ABAddressBook sharedAddressBook] recordForUniqueId: uniqueId];
    NSString* newName = [self nameFromRecord:addressBookRecord];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSManagedObject* coPerson = [self findRecordByUniqueId:uniqueId];
        [coPerson setValue:newName forKey:@"name"];
        [[self sharedObjectContext] save:nil];
    });
}

#pragma mark Event handling

- (IBAction)addSelectedPerson:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray* selectedRecords = peoplePicker.selectedRecords;
        assert([selectedRecords count] == 1);

        ABPerson* selectedPerson = [selectedRecords objectAtIndex:0];
        NSString* name = [self nameFromRecord: selectedPerson];
        
        NSLog(name);
        NSLog([selectedPerson uniqueId]);
        
        NSManagedObjectContext* managedObjectContext = [self sharedObjectContext];
        assert(managedObjectContext != Nil);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSManagedObject* newEntity = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_ADDRESSBOOK_PERSON inManagedObjectContext:managedObjectContext];
            [newEntity setValue:[selectedPerson uniqueId] forKey:@"uniqueId"];
            [newEntity setValue:name forKey:@"name"];
            [managedObjectContext save:nil];
        });
        //TODO: Check for error
    });
}

- (void)handleDoubleClick:(NSArray*)selectedReceivers {
    assert(selectedReceivers != nil);
    if ([selectedReceivers count] == 0) {
        return;
    }
    NSManagedObject* firstSelectedReceiver = [selectedReceivers objectAtIndex:0];
    assert(firstSelectedReceiver != nil);

    if([[[firstSelectedReceiver entity] name] isEqualToString:ENTITY_ADDRESSBOOK_PERSON]){
        NSString *uniqueId = [firstSelectedReceiver uniqueId];
        NSString *urlString = [NSString
                               stringWithFormat:@"addressbook://%@?edit", uniqueId];
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]];  
    } else {
        NSLog(@"Custom entity. Open HUD.");
    }
}

#pragma mark Utilities

-(NSString*)nameFromRecord:(ABRecord*)record
{
    NSString* firstName = [record valueForProperty:kABFirstNameProperty];
    NSString* lastName = [record valueForProperty:kABLastNameProperty];
    NSString* name = [NSString stringWithFormat: @"%@ %@", firstName, lastName];
    
    return name;
}

-(NSManagedObject*)findRecordByUniqueId: (NSString*)uniqueId
{
    NSManagedObjectContext *moc = [self sharedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity: [NSEntityDescription entityForName:ENTITY_ADDRESSBOOK_PERSON inManagedObjectContext: moc]];
    [fetchRequest setPredicate: [NSPredicate predicateWithFormat:@"uniqueId = %@",uniqueId]];
    
    NSArray* result = [[self sharedObjectContext] executeFetchRequest:fetchRequest error:nil];
    if([result count] == 1){
        return [result objectAtIndex:0];
    } else {
        //TODO: How to handle this?
        return nil;
    }
}

-(NSManagedObjectContext*)sharedObjectContext
{
    return [[[NSApplication sharedApplication] delegate] managedObjectContext];
}

@end
