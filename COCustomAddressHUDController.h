//
//  COCustomAddressWindowController.h
//  Correspondence
//
//  Created by Marco Paga on 20.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "COConstants.h"
#import "COCustomAddressHUDController.h"
#import "COSharedContext.h"

@interface COCustomAddressHUDController : NSWindowController {

    NSManagedObject* entity;
}

@property(retain) NSManagedObject* entity;

- (id)initWith: (NSString*) objectId;
- (IBAction)okButton:(id)sender;
- (NSManagedObject*)loadEntityFor: (NSString*) objectId;

@end
