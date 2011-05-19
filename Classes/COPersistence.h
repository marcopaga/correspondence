//
//  COPersistence.h
//  Correspondence
//
//  Created by Marco Paga on 18.05.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COConstants.h"


@interface COPersistence : NSObject {

}


+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

+ (NSManagedObjectModel *)managedObjectModel;

+ (NSManagedObjectContext *)managedObjectContext;

@end

static NSPersistentStoreCoordinator *persistentStoreCoordinator;
static NSManagedObjectModel *managedObjectModel;
static NSManagedObjectContext *managedObjectContext;    