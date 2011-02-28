//
//  Correspondence_AppDelegate.h
//  Correspondence
//
//  Created by MacRae Linton on 8/31/09.
//  Copyright Apple Inc. 2009 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface COAppDelegate : NSObject 
{
    IBOutlet NSWindow *window;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;

- (IBAction)saveAction:sender;

@end
