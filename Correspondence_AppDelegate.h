//
//  Correspondence_AppDelegate.h
//  Correspondence
//
//  Created by MacRae Linton on 8/31/09.
//  Copyright Apple Inc. 2009 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PeopleViewController.h"

@interface Correspondence_AppDelegate : NSObject
{
    IBOutlet NSWindow *window;
    IBOutlet NSView *peopleView;
    NSMutableArray *viewControllers;
    IBOutlet ManagingViewController *peopleViewController;
    IBOutlet NSArrayController *topicsArrayController;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;

- (IBAction)saveAction:sender;

@end
