//
//  Person.m
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import "COPerson.h"


@implementation COPerson
@dynamic email;
@dynamic postalCode;
@dynamic street;
@dynamic city;
@dynamic imageFilename;
@dynamic phoneNumber;

- (NSArray*) createAddressStrings
{
    NSString* name = [self valueForKey:@"name"];
    
    NSString* street = [self valueForKey:@"street"];
    NSString* postalCode = [self valueForKey:@"postalCode"];
    NSString* city = [self valueForKey:@"city"];
    
    NSString* cityRow = [NSString stringWithFormat: @"%@ %@", postalCode, city];
    
    NSMutableArray* addressOutput = [NSMutableArray arrayWithCapacity:3];
    [addressOutput insertObject:[NSString stringWithFormat: @"%@", name] atIndex:0];
    [addressOutput insertObject: [NSString stringWithFormat: @"%@", street] atIndex:1];
    [addressOutput insertObject:cityRow atIndex:2];
    
    return addressOutput;
}

@end
