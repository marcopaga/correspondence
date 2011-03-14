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


@interface COPeoplePickerController : NSObject {
    IBOutlet ABPeoplePickerView *peoplePicker;
}

- (IBAction)addSelectedPerson:(id)sender;

@end