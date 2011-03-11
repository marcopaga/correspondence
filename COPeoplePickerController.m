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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
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
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSManagedObject* newEntity = [NSEntityDescription insertNewObjectForEntityForName:@"AddressbookPerson" inManagedObjectContext:managedObjectContext];
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
    // DoubleClick handling code here
    NSLog(@"(DoubleClick) Receiver: %@", firstSelectedReceiver); // can be deleted
}

@end
