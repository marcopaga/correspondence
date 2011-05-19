//
//  AddressbookPerson.m
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import "COAddressbookPerson.h"


@implementation COAddressbookPerson
@dynamic uniqueId;

- (NSArray *)createAddressStrings {
    NSString *uniqueId = [self valueForKey:@"uniqueId"];
    ABRecord *addressBookRecord = [[ABAddressBook sharedAddressBook] recordForUniqueId:uniqueId];
    assert(addressBookRecord != nil);

    NSString *firstName = [addressBookRecord valueForProperty:kABFirstNameProperty];
    NSString *lastName = [addressBookRecord valueForProperty:kABLastNameProperty];

    NSString *street = @"";
    NSString *postalCode = @"";
    NSString *city = @"";

    ABMutableMultiValue *addresses = [addressBookRecord valueForProperty:kABAddressProperty];
    if (addresses) {
        NSMutableDictionary *anAddress = [addresses valueAtIndex:0];

        street = [anAddress valueForKey:kABAddressStreetKey];
        postalCode = [anAddress valueForKey:kABAddressZIPKey];
        city = [anAddress valueForKey:kABAddressCityKey];
    }

    NSString *nameRow = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    NSString *cityRow = [NSString stringWithFormat:@"%@ %@", postalCode, city];

    NSMutableArray *addressOutput = [NSMutableArray arrayWithCapacity:3];
    [addressOutput insertObject:nameRow atIndex:0];
    [addressOutput insertObject:street atIndex:1];
    [addressOutput insertObject:cityRow atIndex:2];

    return addressOutput;
}

@end
