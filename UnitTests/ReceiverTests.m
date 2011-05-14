//
//  ReceiverTests.m
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "ReceiverTests.h"
#import "COSharedContext.h"


@implementation ReceiverTests

-(void)setUp
{
    [super setUp];
    
    name = @"FirstName LastName";
    street = @"Somestreet. 1";
    postalCode = @"12345";
    city = @"City";    
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
    person.name = name;
    person.street = street;
    person.postalCode = postalCode;
    person.city = city;
    
    NSArray* address = [person createAddressStrings];
    STAssertEqualObjects(3, [address count], @"Expecting 3 rows in result");
    
    STAssertEqualObjects(name, [address objectAtIndex: 0], @"Expecting the name");
    STAssertEqualObjects(street, [address objectAtIndex: 1], @"Expecting the street");
    NSString* thirdLine = [NSString stringWithFormat:@"%@ %@", postalCode, city];
    STAssertEqualObjects(thirdLine , [address objectAtIndex: 2], @"Expecting the postalCode and the city");
}



@end
