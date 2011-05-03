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
    
    // Das Systemaddressbuch holen
    ABAddressBook *addressBook = [ABAddressBook sharedAddressBook];
    
    // Eine neue Person erzeugen
    ABPerson* person = [[ABPerson alloc] initWithAddressBook:addressBook];
    // Simple Attribute befüllen
    [person setValue:@"CorrespondenceUnitTest" forProperty:kABFirstNameProperty];
    [person setValue:@"Nachname" forProperty:kABLastNameProperty];

    // Multi Value für z.B. E-Mail anlegen.
    // Multi Values werden benutzt um z.B. private und geschäftliche Adresse zu trennen
    ABMutableMultiValue* emailAddresses = [[ABMutableMultiValue alloc]init];
    // Wert für Privat
    [emailAddresses addValue:@"private@addresse.de" withLabel: kABEmailHomeLabel];
    // ...und home anlegen
    [emailAddresses addValue:@"geschaeftliche@addresse.de" withLabel: kABEmailWorkLabel];
    // diesen multi value dann dem record zuweisen
    [person setValue:emailAddresses forProperty:kABEmailProperty];
    
    // Eine Addresse besteht aus mehreren Keys die einer dictionary zugewiesen werden
    NSMutableDictionary* anAddress = [NSMutableDictionary dictionary];
    [anAddress setObject:@"Beispielstr. 122" forKey:kABAddressStreetKey];
    [anAddress setObject:@"12345" forKey:kABAddressZIPKey];
    [anAddress setObject:@"Beispielstadt" forKey:kABAddressCityKey];
    [anAddress setObject:@"Deutschland" forKey:kABAddressCountryKey];
   
    // Diese kommt dann auch wieder in einen multi value um es zu unterscheiden
    ABMutableMultiValue *addresses = [[ABMutableMultiValue alloc] init];
    [addresses addValue: anAddress withLabel: kABAddressHomeLabel];
    [person setValue: addresses forProperty: kABAddressProperty];
        
    [addressBook addRecord:person];
    [addressBook save];

    testRecord = person;
    // die uniqueid für unseren core data bezug
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
