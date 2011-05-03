//
//  COPeoplePickerController.h
//  Correspondence
//
//  Created by Marco Paga on 09.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <AddressBook/ABPeoplePickerView.h>
#import "COConstants.h"
#import "COCustomAddressHUDController.h"
#import "COSharedContext.h"

@interface COPeopleController : NSObject {
    IBOutlet ABPeoplePickerView *peoplePicker;
    NSMutableArray *customAddressHudControllers;
}

@property(retain) NSMutableArray *customAddressHudControllers;

-(void)registerForAddressBookNotifications;

-(void)unregisterFromAddressBookNotifications;

- (IBAction)addSelectedPerson:(id)sender;

-(NSManagedObject*)findRecordByUniqueId: (NSString*)uniqueId;

-(NSString*)nameFromRecord:(ABPerson*)person;

-(void)updateRecord:(NSString*)uniqueId;

- (IBAction)addPerson:(id)sender;
@end
