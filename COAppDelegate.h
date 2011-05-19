//
//  Correspondence_AppDelegate.h
//  Correspondence
//
//  Created by MacRae Linton on 8/31/09.
//  Copyright Apple Inc. 2009 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "COConstants.h"
#import "COPersistence.h"

@interface COAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSWindow *window;
}

- (NSManagedObjectContext *)managedObjectContext;

- (NSString *)applicationSupportFolder;

- (IBAction)saveAction:sender;

@end
