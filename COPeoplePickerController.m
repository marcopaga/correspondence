//
//  COPeoplePickerController.m
//  Correspondence
//
//  Created by Marco Paga on 09.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COPeoplePickerController.h"


@implementation COPeoplePickerController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (IBAction)addSelectedPerson:(id)sender {
    NSArray* selectedRecords = peoplePicker.selectedRecords;
    assert([selectedRecords count] == 1);
    ABPerson* selectedPerson = [selectedRecords objectAtIndex:0];
    
    NSString* firstName = [selectedPerson valueForProperty:kABFirstNameProperty];
    NSString* lastName = [selectedPerson valueForProperty:kABLastNameProperty];
    NSString* name = [NSString stringWithFormat: @"%@ %@", firstName,lastName];
    
    NSLog(name);
    NSLog([selectedPerson uniqueId]);
    
    NSManagedObjectContext* managedObjectContext = [[[NSApplication sharedApplication] delegate] managedObjectContext];
    assert(managedObjectContext != Nil);
    
    NSManagedObject* newEntity = [NSEntityDescription insertNewObjectForEntityForName:@"AddressbookPerson" inManagedObjectContext:managedObjectContext];
    [newEntity setValue:[selectedPerson uniqueId] forKey:@"uniqueId"];
    [newEntity setValue:name forKey:@"name"];
    //TODO: Check for error
    [managedObjectContext save:nil];
}
@end
