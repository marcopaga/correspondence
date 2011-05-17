//
//  UnitTests.m
//  UnitTests
//
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import "AddressBookExplorationTest.h"


@implementation AddressBookExplorationTest

- (void)setUp
{
    [super setUp];
    
    ABAddressBook *addressBook = [ABAddressBook sharedAddressBook];
    
    ABPerson* person = [[ABPerson alloc] initWithAddressBook:addressBook];

    [person setValue:@"CorrespondenceUnitTest" forProperty:kABFirstNameProperty];
    [person setValue:@"Nachname" forProperty:kABLastNameProperty];

    ABMutableMultiValue* emailAddresses = [[ABMutableMultiValue alloc]init];
    [emailAddresses addValue:@"private@addresse.de" withLabel: kABEmailHomeLabel];
    [emailAddresses addValue:@"geschaeftliche@addresse.de" withLabel: kABEmailWorkLabel];
    [person setValue:emailAddresses forProperty:kABEmailProperty];
    
    NSMutableDictionary* anAddress = [NSMutableDictionary dictionary];
    [anAddress setObject:@"Beispielstr. 122" forKey:kABAddressStreetKey];
    [anAddress setObject:@"12345" forKey:kABAddressZIPKey];
    [anAddress setObject:@"Beispielstadt" forKey:kABAddressCityKey];
    [anAddress setObject:@"Deutschland" forKey:kABAddressCountryKey];
   
    ABMutableMultiValue *addresses = [[ABMutableMultiValue alloc] init];
    [addresses addValue: anAddress withLabel: kABAddressHomeLabel];
    [person setValue: addresses forProperty: kABAddressProperty];
        
    [addressBook addRecord:person];
    [addressBook save];

    testRecord = person;

    uniqueId = [person uniqueId];
    STAssertNotNil(uniqueId,@"Created unique Id must not be null");
}

- (void)tearDown
{
    [[ABAddressBook sharedAddressBook] removeRecord: testRecord];
    [[ABAddressBook sharedAddressBook] save];
    
    [super tearDown];
}

- (void)testAddressBookSearchViaFirstName
{
    ABAddressBook *addressBook = [ABAddressBook sharedAddressBook];
    
    ABSearchElement *testUserSearch =
    [ABPerson searchElementForProperty:kABFirstNameProperty
                                 label:nil
                                   key:nil
                                 value:@"CorrespondenceUnitTest"
                            comparison:kABEqualCaseInsensitive];
    NSArray *peopleFound = [addressBook recordsMatchingSearchElement:testUserSearch];
    STAssertTrue([peopleFound count] == 1, @"Just one person expected");
}

- (void)testAddressBookSearchViaUniqueId
{
    ABAddressBook *addressBook = [ABAddressBook sharedAddressBook];
    ABRecord *found = [addressBook recordForUniqueId:uniqueId];
    
    STAssertEquals(@"CorrespondenceUnitTest", [found valueForProperty: kABFirstNameProperty], @"Expecting to find the testuser");
}

@end
