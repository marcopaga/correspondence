//
//  UnitTests.h
//  UnitTests
//
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <AddressBook/AddressBook.h>


@interface UnitTests : SenTestCase {
@private
    ABRecord* testRecord;
    NSString* uniqueId;
}

@end
