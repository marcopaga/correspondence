//
//  ManagingViewController.h
//  Correspondence
//
//  Created by Robert Retzbach on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ManagingViewController : NSViewController {
    NSManagedObjectContext *managedObjectContext;
    IBOutlet NSArrayController *arrayController;
}

@property (retain) NSManagedObjectContext *managedObjectContext;
@property (retain) NSArrayController *arrayController;
@end
