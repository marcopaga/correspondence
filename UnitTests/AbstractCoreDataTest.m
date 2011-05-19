//
//  AbstractCoreDataTest.m
//  Correspondence
//
//  Created by Marco Paga on 14.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "AbstractCoreDataTest.h"


@implementation AbstractCoreDataTest

- (void)setUp {
    NSLog(@"Setting up transient CoreData environment");

    // The Core Data Model needs to included in the test target and
    // added explicitly from another bundle
    NSArray *bundles =
            [NSArray arrayWithObject:[NSBundle bundleForClass:[self class]]];
    managedObjectModel =
            [[NSManagedObjectModel mergedModelFromBundles:bundles] retain];

    persistentStoreCoordinator =
            [[NSPersistentStoreCoordinator alloc]
                    initWithManagedObjectModel:managedObjectModel];

    persistentStore = [persistentStoreCoordinator
            addPersistentStoreWithType:NSInMemoryStoreType
                         configuration:nil URL:nil options:nil error:NULL];

    objectContext = [[NSManagedObjectContext alloc] init];
    [objectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
}

- (void)tearDown {
    NSLog(@"Shutting down transient CoreData environment");
    [objectContext release];
    objectContext = nil;

    NSError *error = nil;
    STAssertTrue([persistentStoreCoordinator removePersistentStore: persistentStore error: &error],
    @"couldn't remove persistent store: %@", error);

    persistentStore = nil;

    [persistentStoreCoordinator release];
    persistentStoreCoordinator = nil;

    [managedObjectModel release];
    managedObjectModel = nil;
}

- (void)testThatEnvironmentWorks {
    STAssertNotNil(persistentStore, @"No persistent store set up!");
    STAssertNotNil(objectContext, @"No object context set up!");
}

@end
