//
//  Correspondence_AppDelegate.h
//  Correspondence
//
//  Created by MacRae Linton on 8/31/09.
//  Copyright Apple Inc. 2009 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PXListView.h"
#import "MyListViewCell.h"

@interface COAppDelegate : NSObject <NSApplicationDelegate, PXListViewDelegate>
{
    IBOutlet NSWindow *window;
    IBOutlet NSArrayController *messageArrayController;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    
    // Message
    IBOutlet PXListView	*listView;

}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;

- (IBAction)saveAction:sender;

@end
