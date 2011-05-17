//
//  ReceiverTests.m
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "ReceiverTests.h"

@implementation ReceiverTests

NSString* const FIRST_NAME = @"Correspondence-ReceiverTest-FirstName";
NSString* const LAST_NAME = @"LastName";
NSString* const NAME = @"Correspondence-ReceiverTest-FirstName LastName";
NSString* const STREET = @"Somestreet. 1";
NSString* const POSTAL_CODE = @"12345";
NSString* const CITY = @"City";



-(void)tearDown
{
    if(uniqueId != nil){
        ABAddressBook* sharedAddressBook = [ABAddressBook sharedAddressBook];
        ABRecord* record = [sharedAddressBook recordForUniqueId:uniqueId];

        if([[record valueForProperty:kABFirstNameProperty] isEqualToString:@"Correspondence-ReceiverTest-FirstName"]){
            [sharedAddressBook save];
            [sharedAddressBook removeRecord: record];
        } else {
            STFail(@"AddressBook could not be cleaned up. Correspondence Test user still present or never created?");
        }
    }
    [super tearDown];
}

-(NSManagedObject*)newEntity: (NSString*) entityName
{
    return [NSEntityDescription
              insertNewObjectForEntityForName: entityName
              inManagedObjectContext:objectContext];

}


- (void)testAddressGenerationForPersonWithoutData
{
    COPerson* person = [self newEntity:@"Person"];
    NSArray* address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");
}

- (void)testAddressGenerationForPerson
{
    COPerson* person = [self newEntity:@"Person"];
    person.name = NAME;
    person.street = STREET;
    person.postalCode = POSTAL_CODE;
    person.city = CITY;

    NSArray* address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");

    STAssertEqualObjects(NAME, [address objectAtIndex: 0], @"Expecting the name");
    STAssertEqualObjects(STREET, [address objectAtIndex: 1], @"Expecting the street");
    NSString* thirdLine = [NSString stringWithFormat:@"%@ %@", POSTAL_CODE, CITY];
    STAssertEqualObjects(thirdLine , [address objectAtIndex: 2], @"Expecting the postalCode and the city");
}

- (NSString*)createSamplePersonInAddressBook
{
    ABAddressBook *addressBook = [ABAddressBook sharedAddressBook];
    ABPerson* person = [[ABPerson alloc] initWithAddressBook:addressBook];

    [person setValue: FIRST_NAME forProperty:kABFirstNameProperty];
    [person setValue: LAST_NAME forProperty:kABLastNameProperty];

    NSMutableDictionary* anAddress = [NSMutableDictionary dictionary];
    [anAddress setObject: STREET forKey:kABAddressStreetKey];
    [anAddress setObject: POSTAL_CODE forKey:kABAddressZIPKey];
    [anAddress setObject: CITY forKey:kABAddressCityKey];

    ABMutableMultiValue *addresses = [[ABMutableMultiValue alloc] init];
    [addresses addValue: anAddress withLabel: kABAddressHomeLabel];
    [person setValue: addresses forProperty: kABAddressProperty];

    [addressBook addRecord:person];
    [addressBook save];

    uniqueId = [person uniqueId];
    return uniqueId;
}

- (void)testAddressGenerationForAddressbookPersonWithoutData
{
    uniqueId = [self createSamplePersonInAddressBook];

    COAddressbookPerson* person = [self newEntity:@"AddressbookPerson"];
    person.uniqueId = uniqueId;

    NSArray* address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");
}

- (void)testAddressGenerationForAddressbookPerson
{
    uniqueId = [self createSamplePersonInAddressBook];

    COAddressbookPerson* person = [self newEntity:@"AddressbookPerson"];
    person.uniqueId = uniqueId;

    NSArray* address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");

    STAssertEqualObjects(NAME, [address objectAtIndex: 0], @"Expecting the name");
    STAssertEqualObjects(STREET, [address objectAtIndex: 1], @"Expecting the street");
    NSString* thirdLine = [NSString stringWithFormat:@"%@ %@", POSTAL_CODE, CITY];
    STAssertEqualObjects(thirdLine , [address objectAtIndex: 2], @"Expecting the postalCode and the city");
}


@end
