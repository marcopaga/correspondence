//
//  COPeoplePickerController.m
//  Correspondence
//
//  Created by Marco Paga on 09.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COPeopleController.h"


@implementation COPeopleController

@synthesize customAddressHudControllers;

#pragma mark Lifecycle

- (id)init {
    self = [super init];
    if (self) {
        customAddressHudControllers = [[NSMutableArray array] retain];
    }

    return self;
}

- (void)dealloc {
    if (customAddressHudControllers != nil) {
        [customAddressHudControllers release];
        customAddressHudControllers = nil;
    }
    [super dealloc];
}

#pragma mark Event handling

- (IBAction)addSelectedPerson:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *selectedRecords = peoplePicker.selectedRecords;
        assert([selectedRecords count] == 1);

        ABPerson *selectedPerson = [selectedRecords objectAtIndex:0];
        NSString *name = [self nameFromRecord:selectedPerson];

        NSLog(name);
        NSLog([selectedPerson uniqueId]);

        NSManagedObjectContext *managedObjectContext = [self sharedObjectContext];
        assert(managedObjectContext != Nil);

        dispatch_async(dispatch_get_main_queue(), ^{
            NSManagedObject *newEntity = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_ADDRESSBOOK_PERSON inManagedObjectContext:managedObjectContext];
            [newEntity setValue:[selectedPerson uniqueId] forKey:@"uniqueId"];
            [newEntity setValue:name forKey:@"name"];
            NSError *error = nil;
            [managedObjectContext save: &error];
            if(error != nil){
                int alertReturn = NSRunAlertPanel(nil, @"Could not create new entry", @"OK",nil,nil);
                NSLog([error description]);
            }
        });
    });
}

- (void)openAddressBook:(NSManagedObject *)receiver {
    NSString *uniqueId = [receiver uniqueId];
    NSString *urlString = [NSString stringWithFormat:@"addressbook://%@?edit", uniqueId];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]];

}

- (void)openHudWindow:(NSManagedObject *)receiver {
    COCustomAddressHUDController *newController = [[COCustomAddressHUDController alloc] initFor:[receiver objectID] andRegisterAt: self];
    [newController showWindow:self];
    [newController autorelease];
}

- (void)handleDoubleClick:(NSArray *)selectedReceivers {
    assert(selectedReceivers != nil);
    if ([selectedReceivers count] == 0) {
        return;
    }
    NSManagedObject *firstSelectedReceiver = [selectedReceivers objectAtIndex:0];
    assert(firstSelectedReceiver != nil);

    if ([[[firstSelectedReceiver entity] name] isEqualToString:ENTITY_ADDRESSBOOK_PERSON]) {
        [self openAddressBook:firstSelectedReceiver];

    } else {
        [self openHudWindow:firstSelectedReceiver];

    }
}

#pragma mark Utilities

- (NSString *)nameFromRecord:(ABPerson *)record {
    NSString *firstName = [record valueForProperty:kABFirstNameProperty];
    NSString *lastName = [record valueForProperty:kABLastNameProperty];
    NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];

    return name;
}

- (NSManagedObjectContext *)sharedObjectContext {
    return [COPersistence managedObjectContext];
}

- (IBAction)addPerson:(id)sender {
    NSManagedObjectContext *moc = [self sharedObjectContext];
    NSManagedObject *newEntity = [NSEntityDescription insertNewObjectForEntityForName:
    ENTITY_PERSON                                              inManagedObjectContext:moc];
    [newEntity setValue:@"Unnamed" forKey:@"name"];
    [moc save:nil];
}

#pragma mark COOwner protocol methods

- (void) registerDependentController:(id)controller;
{
    [controller retain];
    [customAddressHudControllers addObject: controller];
}

- (void) unregisterDependentController:(id)controller;
{
    [customAddressHudControllers removeObject: controller];
    [controller autorelease];
}

@end
