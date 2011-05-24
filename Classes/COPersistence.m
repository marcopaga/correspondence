//
//  COPersistence.m
//  Correspondence
//
//  Created by Marco Paga on 18.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COPersistence.h"


@implementation COPersistence

+ (void)initialize
{
    persistentStoreCoordinatorLock = [NSLock new];
    
}

+ (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Correspondence_DataModel" ofType:@"momd"];
    NSURL *momURL = [NSURL fileURLWithPath:path];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];

    return managedObjectModel;
}

+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{

    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }

    NSFileManager *fileManager;
    NSString *applicationSupportFolder = nil;
    NSURL *url;
    NSError *error;

    fileManager = [NSFileManager defaultManager];
    applicationSupportFolder = [[[NSApplication sharedApplication] delegate] applicationSupportFolder];
    if (![fileManager
            fileExistsAtPath: applicationSupportFolder
                 isDirectory: NULL]) {
        [fileManager
                     createDirectoryAtPath: applicationSupportFolder
               withIntermediateDirectories: YES
                                attributes: nil
                                     error: &error ];
    }

    NSString *coreDataFile = [APP_NAME stringByAppendingString:@".sqlite"];
    url = [NSURL fileURLWithPath:[applicationSupportFolder stringByAppendingPathComponent:coreDataFile]];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];

    NSDictionary *options =
        [NSDictionary dictionaryWithObjectsAndKeys:
            [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
            [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil
         ];

    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:options error:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
    
    return persistentStoreCoordinator;
}

+ (NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}

@end
