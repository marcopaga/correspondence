//
//  CorrespondenceBaseTest.h
//  Correspondence
//
//  Created by Marco Paga on 29.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import <SenTestingKit/SenTestingKit.h>
#import "AbstractCoreDataTest.h"
#import "COPerson.h"
#import "COAddressbookPerson.h"

@interface CorrespondenceBaseTest : AbstractCoreDataTest {
    NSString *uniqueId;
}

extern NSString *const FIRST_NAME;
extern NSString *const LAST_NAME;
extern NSString *const NAME;
extern NSString *const STREET;
extern NSString *const POSTAL_CODE;
extern NSString *const CITY;

- (NSString *)createSamplePersonInAddressBook;

@end
