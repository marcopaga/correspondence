//
//  ReceiverTests.h
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "AbstractCoreDataTest.h"
#import "COPerson.h"
#import "COAddressbookPerson.h"
#import "COSharedContext.h"


@interface ReceiverTests : AbstractCoreDataTest
{
    NSString* uniqueId;
}

extern NSString* const FIRST_NAME;
extern NSString* const LAST_NAME;
extern NSString* const NAME;
extern NSString* const STREET;
extern NSString* const POSTAL_CODE;
extern NSString* const CITY;


@end
