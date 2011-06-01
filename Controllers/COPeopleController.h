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
#import "COPersistence.h"
#import "COConstants.h"
#import "COCustomAddressHUDController.h"
#import "COOwner.h"

@interface COPeopleController : NSObject <COOwner> {
    IBOutlet ABPeoplePickerView *peoplePicker;
    NSMutableArray *customAddressHudControllers;
}

@property(retain) NSMutableArray *customAddressHudControllers;

- (IBAction)addSelectedPerson:(id)sender;

- (IBAction)addPerson:(id)sender;

- (void) registerDependentController:(id)controller;

- (void) unregisterDependentController:(id)controller;
@end
