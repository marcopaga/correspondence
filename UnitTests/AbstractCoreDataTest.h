//
//  AbstractCoreDataTest.h
//  Correspondence
//
//  Created by Marco Paga on 14.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>


@interface AbstractCoreDataTest : SenTestCase {
    
    NSManagedObjectContext* objectContext;

@private
    NSManagedObjectModel* managedObjectModel;
    NSPersistentStoreCoordinator* persistentStoreCoordinator;
    NSPersistentStore* persistentStore;
}

@end
