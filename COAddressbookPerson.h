//
//  AddressbookPerson.h
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "COReceiver.h"
#import <AddressBook/AddressBook.h>

@interface COAddressbookPerson : COReceiver {
@private
}
@property (nonatomic, retain) NSString * uniqueId;

@end
