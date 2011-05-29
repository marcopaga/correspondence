//
//  Correspondence_AppDelegate.m
//  Correspondence
//
//  Created by MacRae Linton on 8/31/09.
//  Copyright Apple Inc. 2009 . All rights reserved.
//

#import "COAppDelegate.h"

@implementation COAppDelegate

-(void) awakeFromNib
{
    notificationHandler = [CONotificationHandler new];
    [notificationHandler scanAddressBookForChanges];
}

- (void)dealloc
{
    [notificationHandler release];
    notificationHandler = nil;
    [super dealloc];
}

- (NSManagedObjectContext *)managedObjectContext {
    return [COPersistence managedObjectContext];
}

/**
    Returns the support folder for the application, used to store the Core Data
    store file.  This code uses a folder named "Correspondence" for
    the content, either in the NSApplicationSupportDirectory location or (if the
    former cannot be found), the system's temporary directory.
 */

- (NSString *)applicationSupportFolder {

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
    return [basePath stringByAppendingPathComponent:APP_NAME];
}

/**
    Returns the NSUndoManager for the application.  In this case, the manager
    returned is that of the managed object context for the application.
 */

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window {
    return [[self managedObjectContext] undoManager];
}


/**
    Performs the save action for the application, which is to send the save:
    message to the application's managed object context.  Any encountered errors
    are presented to the user.
 */

- (IBAction)saveAction:(id)sender {

    NSError *error = nil;
    if (![[self managedObjectContext] save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}

/**
    Implementation of the applicationShouldTerminate: method, used here to
    handle the saving of changes in the application managed object context
    before the application terminates.
 */

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {

    NSError *error;
    int reply = NSTerminateNow;

    if ([self managedObjectContext] != nil) {
        if ([[self managedObjectContext] commitEditing]) {
            if ([[self managedObjectContext] hasChanges] && ![[self managedObjectContext] save:&error]) {

                // This error handling simply presents error information in a panel with an 
                // "Ok" button, which does not include any attempt at error recovery (meaning, 
                // attempting to fix the error.)  As a result, this implementation will 
                // present the information to the user and then follow up with a panel asking 
                // if the user wishes to "Quit Anyway", without saving the changes.

                // Typically, this process should be altered to include application-specific 
                // recovery steps.  

                BOOL errorResult = [[NSApplication sharedApplication] presentError:error];

                if (errorResult == YES) {
                    reply = NSTerminateCancel;
                }

                else {

                    int alertReturn = NSRunAlertPanel(nil, @"Could not save changes while quitting. Quit anyway?", @"Quit anyway", @"Cancel", nil);
                    if (alertReturn == NSAlertAlternateReturn) {
                        reply = NSTerminateCancel;
                    }
                }
            }
        }

        else {
            reply = NSTerminateCancel;
        }
    }

    return reply;
}

@end
