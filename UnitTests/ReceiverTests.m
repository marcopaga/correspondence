//
//  ReceiverTests.m
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "ReceiverTests.h"

@implementation ReceiverTests


- (void)testAddressGenerationForPersonWithoutData {
    COPerson *person = [self newEntity:@"Person"];
    NSArray *address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");
}

- (void)testAddressGenerationForPerson {
    COPerson *person = [self newEntity:@"Person"];
    person.name = NAME;
    person.street = STREET;
    person.postalCode = POSTAL_CODE;
    person.city = CITY;

    NSArray *address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");

    STAssertEqualObjects(NAME, [address objectAtIndex: 0], @"Expecting the name");
    STAssertEqualObjects(STREET, [address objectAtIndex: 1], @"Expecting the street");
    NSString *thirdLine = [NSString stringWithFormat:@"%@ %@", POSTAL_CODE, CITY];
    STAssertEqualObjects(thirdLine, [address objectAtIndex: 2], @"Expecting the postalCode and the city");
}

- (void)testAddressGenerationForAddressbookPersonWithoutData {
    uniqueId = [self createSamplePersonInAddressBook];

    COAddressbookPerson *person = [self newEntity:@"AddressbookPerson"];
    person.uniqueId = uniqueId;

    NSArray *address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");
}

- (void)testAddressGenerationForAddressbookPerson {
    uniqueId = [self createSamplePersonInAddressBook];

    COAddressbookPerson *person = [self newEntity:@"AddressbookPerson"];
    person.uniqueId = uniqueId;

    NSArray *address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");

    STAssertEqualObjects(NAME, [address objectAtIndex: 0], @"Expecting the name");
    STAssertEqualObjects(STREET, [address objectAtIndex: 1], @"Expecting the street");
    NSString *thirdLine = [NSString stringWithFormat:@"%@ %@", POSTAL_CODE, CITY];
    STAssertEqualObjects(thirdLine, [address objectAtIndex: 2], @"Expecting the postalCode and the city");
}


@end
