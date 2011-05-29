//
//  CorrespondenceBaseTest.m
//  Correspondence
//
//  Created by Marco Paga on 29.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "CorrespondenceBaseTest.h"


@implementation CorrespondenceBaseTest

NSString *const FIRST_NAME = @"Correspondence-ReceiverTest-FirstName";
NSString *const LAST_NAME = @"LastName";
NSString *const NAME = @"Correspondence-ReceiverTest-FirstName LastName";
NSString *const STREET = @"Somestreet. 1";
NSString *const POSTAL_CODE = @"12345";
NSString *const CITY = @"City";


- (void)tearDown {
    if (uniqueId != nil) {
        ABAddressBook *sharedAddressBook = [ABAddressBook sharedAddressBook];
        ABRecord *record = [sharedAddressBook recordForUniqueId:uniqueId];
        
        [sharedAddressBook removeRecord:record];
        [sharedAddressBook save];
    }
    [super tearDown];
}

- (NSString *)createSamplePersonInAddressBook {
    ABAddressBook *addressBook = [ABAddressBook sharedAddressBook];
    ABPerson *person = [[ABPerson alloc] initWithAddressBook:addressBook];
    
    [person setValue:FIRST_NAME forProperty:kABFirstNameProperty];
    [person setValue:LAST_NAME forProperty:kABLastNameProperty];
    
    NSMutableDictionary *anAddress = [NSMutableDictionary dictionary];
    [anAddress setObject:STREET forKey:kABAddressStreetKey];
    [anAddress setObject:POSTAL_CODE forKey:kABAddressZIPKey];
    [anAddress setObject:CITY forKey:kABAddressCityKey];
    
    ABMutableMultiValue *addresses = [[ABMutableMultiValue alloc] init];
    [addresses addValue:anAddress withLabel:kABAddressHomeLabel];
    [person setValue:addresses forProperty:kABAddressProperty];
    
    [addressBook addRecord:person];
    [addressBook save];
    
    uniqueId = [person uniqueId];
    return uniqueId;
}

@end
