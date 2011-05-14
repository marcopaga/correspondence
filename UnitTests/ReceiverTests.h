//
//  ReceiverTests.h
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "AbstractCoreDataTest.h"
#import "COPerson.h"
#import "COSharedContext.h"


@interface ReceiverTests : AbstractCoreDataTest {
    NSString* name;
    NSString* street;
    NSString* postalCode;
    NSString* city;
}

@end
